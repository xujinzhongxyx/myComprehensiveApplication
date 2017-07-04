//
//  CATabBarController.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/15.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "CATabBarController.h"

#import "CAmessageViewController.h"
#import "CAaddressBookViewController.h"
#import "CAfindViewController.h"
#import "CAmyViewController.h"

@interface CATabBarController ()

@property(strong, nonatomic) UIImageView *imageView;
@property(strong, nonatomic) NSString *strObject;

@end

@implementation CATabBarController

- (instancetype)init
{
    if (self=[super init]) {
        [self.tabBar setHidden:YES];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViewControllers];
    [self initTabBar];
}

- (void)initViewControllers{
    
    UINavigationController *navMessageVC, *navAddressBookVC, *navFindVC, *navMyVC;
    
    navMessageVC = [[UINavigationController alloc] initWithRootViewController:[[CAmessageViewController alloc] init]];
    
    navAddressBookVC = [[UINavigationController alloc] initWithRootViewController:[[CAaddressBookViewController alloc] init]];
    
    navFindVC = [[UINavigationController alloc] initWithRootViewController:[[CAfindViewController alloc] init]];
    
    navMyVC = [[UINavigationController alloc] initWithRootViewController:[[CAmyViewController alloc] init]];
    
    self.viewControllers = @[navMessageVC, navAddressBookVC, navFindVC, navMyVC];
}


- (void)initTabBar{
    _tabBarView = [[LStabBarView alloc] init:self.view];
    [self.view addSubview:_tabBarView];
    
    CGFloat spaceWidth = (CGRectGetWidth(self.view.bounds)-45*4)/5;
    
    for (int i=0; i<4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(spaceWidth + i*45 + i*spaceWidth, 20, 60, 50);
        button.titleLabel.font = [UIFont systemFontOfSize:17.f];
        button.tag = i;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"bar_imag%zi", i+1]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarView addSubview:button];
        [button bringSubviewToFront:_tabBarView];
    }
}

-(NSArray *)buttonName
{
    return @[
             @"聊天",
             @"通讯录",
             @"通讯录",
             @"发现",
             @"我"
             ];
}

- (void)selectedTab:(UIButton *)button
{
    NSArray *aryViews = [_tabBarView subviews];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"bar_imag%zi_click", button.tag+1]] forState:UIControlStateNormal];
    [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(20);
        make.bottom.equalTo(button.mas_top).offset(8);
        make.centerX.equalTo(button);
    }];
    
    for (UIButton *curButton in aryViews) {
        if ([curButton isKindOfClass:[UIButton class]]) {
            if (curButton.tag != button.tag) {
                [curButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"bar_imag%zi", curButton.tag+1]] forState:UIControlStateNormal];
            }
        }
    }
    self.selectedIndex = button.tag;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"down"];
        [_tabBarView addSubview:_imageView];
    }
    
    return _imageView;
}

@end
