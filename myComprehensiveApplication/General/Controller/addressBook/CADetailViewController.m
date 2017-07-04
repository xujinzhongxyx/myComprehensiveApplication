//
//  CADetailViewController.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/19.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "CADetailViewController.h"

@interface CADetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) RACSignal *signalImage;
@property(strong, nonatomic) RACSignal *signalName;

@property(strong, nonatomic) UITableView *tableView;


@end

@implementation CADetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubViews];
}

-(void)loadSubViews
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.signalSubject subscribeNext:^(NSDictionary *x) {
        RACSignal *signal = [RACSignal return:x];
        _signalImage = [signal map:^id (NSDictionary *x) {
            return x[@"headImage"];
        }];
        _signalName = [signal map:^id (NSDictionary *x) {
            return x[@"name"];
        }];
    }];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    RAC(self, title) = _signalName;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 3;
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
    return 70;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    RAC(cell.imageView, image) = _signalImage;
    RAC(cell.textLabel, text) = _signalName;
    
    switch (indexPath.section) {
        case 0:
            cell.backgroundColor = [UIColor yellowColor];
            break;
        case 1:
            cell.backgroundColor = [UIColor whiteColor];
            break;
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
