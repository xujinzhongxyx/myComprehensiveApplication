//
//  CAAddressBookViewController.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/15.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "CAaddressBookViewController.h"
#import "LSAddressBookCell.h"
#import "addressBookViewModel.h"
#import "LSAddressBookCellModel.h"
#import "CADetailViewController.h"

@interface CAaddressBookViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) LSBaseTableView *tableView;
@property(strong, nonatomic) NSArray *aryData;

@end

@implementation CAaddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"通讯录";
    
    [self initObject];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(LSBaseTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[ LSBaseTableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    
    return _tableView;
}

#pragma mark UITableView 代理方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *aryDataWithSection = ((NSDictionary *)_aryData[section])[@"list"];
    return aryDataWithSection.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _aryData.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.f;
}

-(LSAddressBookCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"addressBookCell";
    
    LSAddressBookCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[LSAddressBookCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    LSAddressBookCellModel *model = [[LSAddressBookCellModel alloc] init];
    NSArray *aryDataWithSection = ((NSDictionary *)_aryData[indexPath.section])[@"list"];
    [model bingWithModel:aryDataWithSection[indexPath.row]];
    
    addressBookViewModel *viewModel = [[addressBookViewModel alloc] initWithMode:model];
    
    [cell bingWithViewModel:viewModel];
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor grayColor];
    
    UILabel *lab = [[UILabel alloc] init];
    lab.textColor = [UIColor blackColor];
    lab.font = [UIFont systemFontOfSize:16.f];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = ((NSDictionary *)_aryData[section])[@"sectionName"];
    [view addSubview:lab];
    
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view);
    }];
    
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSAddressBookCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSDictionary *cellDic = @{
                              @"headImage":cell.headImage.image,
                              @"name":cell.name.text
                              };
    
    CADetailViewController *deailVC = [[CADetailViewController alloc] init];
    deailVC.signalSubject = [RACReplaySubject subject];
    [deailVC.signalSubject sendNext:cellDic];

    [self.navigationController pushViewController:deailVC animated:YES];
}

-(void) initObject
{
    self.tableView.backgroundColor = [UIColor whiteColor];

    _aryData = [[helper getDataFromFile:@"addressBookFile" fileType:@"json"] mutableCopy];;
}


@end
