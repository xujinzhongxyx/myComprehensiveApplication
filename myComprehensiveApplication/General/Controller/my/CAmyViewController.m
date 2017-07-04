//
//  CAmyViewController.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/15.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "CAmyViewController.h"
#import "myViewModel.h"
#import "LSMyCellModely.h"
#import "LSMyHeadCell.h"
#import "LSMyListCell.h"
#import "LSBaseTableView.h"

#import "myDetailViewController.h"

@interface CAmyViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) NSDictionary *myAllData;

@property(strong, nonatomic) LSBaseTableView *tableView;


@end

@implementation CAmyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"我";
    
    _myAllData = [helper getDataFromFile:@"myFile" fileType:@"json"];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(LSBaseTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[LSBaseTableView alloc] init];
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"##### _myAllData.count = %zi", _myAllData.count);
    return _myAllData.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (0==section) {
        return 1;
    }
    else if (1==section){
        return ((NSArray*)_myAllData[@"list"]).count;
    }
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 80;
            
        case 1:
            return 50;
    }
    
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dicHead = _myAllData[@"head"];
    NSArray *list = _myAllData[@"list"];
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:dicHead forKey:@"head"];
    [dic setObject:list[indexPath.row] forKey:@"list"];
    
    LSMyCellModely *model = [[LSMyCellModely alloc] init];
    [model bingWithModel:dic];
    
    static NSString *identifier = @"cell";
    LSBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    myViewModel *viewModel = [[myViewModel alloc] initWithMode:model];
    
    if (0==indexPath.section) {
        if (!cell) {
            cell = [[LSMyHeadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
    }
    else if (1==indexPath.section){
        if (!cell) {
            cell = [[LSMyListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
    }
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [cell bingWithViewModel:viewModel];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0==indexPath.section) {
        myDetailViewController *myDetailVC = [[myDetailViewController alloc] init];
        [self.navigationController pushViewController:myDetailVC animated:YES];
    }
}


@end
