//
//  CAfindViewController.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/15.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "CAfindViewController.h"
#import "LSFindView.h"
#import "LSFindSliderView.h"
#import "LSFindSelectedView.h"

@interface CAfindViewController ()

@property(strong, nonatomic) LSFindView *findView;
@property(strong, nonatomic) LSFindSliderView *sliderView;
@property(strong, nonatomic) LSFindSelectedView *selectedView;

@end

@implementation CAfindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"发现";
    
//    [self.findView.commandColor.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
//        NSLog(@"click FV color command");
//    }];
//    
//    [self.findView.commandClean.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
//        NSLog(@"click FV clean command");
//    }];
    [self loadSubViews];
}

-(void)loadSubViews
{
    [self.sliderView.clickIndexSubject subscribeNext:^(NSDictionary *x) {
        self.selectedView.index = [x[@"index"] integerValue];
        self.selectedView.title = x[@"title"];
    }];
    
    [self.sliderView.clickIndexSubject  sendNext:@{@"title":@"查询", @"index":@(0)}];
}


-(LSFindSliderView *)sliderView
{
    if (!_sliderView) {
        CGFloat height = self.navigationController.navigationBar.frame.size.height+20;
        _sliderView = [[LSFindSliderView alloc] initWithFrame:CGRectMake(0, height, 90, CGRectGetHeight(self.view.bounds)-height-49)];
        _sliderView.backgroundColor = [UIColor grayColor];
        [self.view addSubview:_sliderView];
    }
    
    return _sliderView;
}

-(LSFindSelectedView *)selectedView
{
    if (!_selectedView) {
        _selectedView = [[LSFindSelectedView alloc] initWithFrame:CGRectZero];
        _selectedView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_selectedView];
        
        [_selectedView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_sliderView.mas_right);
            make.top.height.equalTo(_sliderView);
            make.width.equalTo(self.view).offset(-90);
        }];
    }
    
    return _selectedView;
}

-(LSFindView *)findView
{
    if (!_findView) {
        _findView = [[LSFindView alloc] init];
        _findView.backgroundColor = [UIColor grayColor];
        [self.view addSubview:_findView];
        
        [_findView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.view);
            make.height.offset(200);
            make.centerY.equalTo(self.view);
        }];
    }
    
    return _findView;
}

@end
