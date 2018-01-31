//
//  ViewController.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/15.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "CAmessageViewController.h"
#import "LSMessageCell.h"
#import "messageViewModel.h"
#import "LSMessageCellModel.h"

@interface CAmessageViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray  *aryData;
}

@property(strong, nonatomic) LSBaseTableView *tableView;

@end

@implementation CAmessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"聊天";
    UIButton *pushButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [pushButton setTitle:@"弹出" forState:UIControlStateNormal];
    [pushButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [[pushButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
    }];
    
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc] initWithCustomView:pushButton];
    
    [self initObject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#define mark  UITableView 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return aryData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"LSMessageCell";
    
    LSMessageCell *cell = (LSMessageCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[LSMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //在cell中不显示移动那妞
    cell.showsReorderControl = NO;
    
    LSMessageCellModel *model = [[LSMessageCellModel alloc] init];
    [model bingWithModel:aryData[indexPath.row]];
    
    messageViewModel *viewMode = [[messageViewModel alloc] initWithMode:model];
    
    [cell bingWithViewModel:viewMode];
    
    return cell;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cellView = [tableView cellForRowAtIndexPath:indexPath];
//    if (cellView.accessoryType == UITableViewCellAccessoryNone) {
//        cellView.accessoryType=UITableViewCellAccessoryCheckmark;
//    }
//    else {
//        cellView.accessoryType = UITableViewCellAccessoryNone;
//        [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    }
//}

#pragma mark --移动处理
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//打开编辑模式后，默认情况下每行左边会出现红的删除按钮，这个方法就是关闭这些按钮的
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSInteger sourceRow = sourceIndexPath.row;
    NSInteger toRow = destinationIndexPath.row;
    
    id object = aryData[sourceRow];
    [aryData removeObjectAtIndex:sourceRow];
    [aryData insertObject:object atIndex:toRow];
}

//设置进入编辑状态时，Cell不会缩进
- (BOOL)tableView: (UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

#pragma mark --左滑编辑 删除，修改名称
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [aryData removeObjectAtIndex:indexPath.row];
//        [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        NSLog(@"#### del = %zi", indexPath.row);
//    }
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return @"下载";
//}
//
//#pragma mark --左滑编辑 添加多个按钮
//- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewRowAction *rowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
//                                       title:@"收藏" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//                                       NSLog(@"收藏点击事件");
//                                       }];
//    
//    UITableViewRowAction *rowAction2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
//                                       title:@"顶置" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//                                       NSLog(@"顶置按钮点击事件");
//                                       }];
//    
//    rowAction.backgroundColor = [UIColor grayColor];
//    
//    NSArray *arr = @[rowAction,rowAction2];
//    return arr;
//}

- (void)initObject
{
    NSDate*date = [NSDate date];
    NSCalendar*calendar = [NSCalendar currentCalendar];
    NSDateComponents*comps;    // 年月日获得
    
    comps =[calendar components:(kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay| kCFCalendarUnitHour | kCFCalendarUnitMinute |kCFCalendarUnitSecond) fromDate:date];
    
    aryData =  [[helper getDataFromFile:@"messageFile" fileType:@"json"] mutableCopy];
    
    _tableView = [[LSBaseTableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView setEditing:YES animated:YES];
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    [_tableView.headerCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        //
    }];
    
    [_tableView.footerCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        //NSLog(@"### footer");
    }];
}

@end
