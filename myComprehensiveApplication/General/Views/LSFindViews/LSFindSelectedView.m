//
//  LSFindSelectedView.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/23.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "LSFindSelectedView.h"

@implementation LSFindSelectedView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self loadSubViews];
    }
    
    return self;
}

-(void)loadSubViews
{
    UIButton *button = [[UIButton alloc] init];
    button.layer.backgroundColor = [UIColor greenColor].CGColor;
    button.layer.cornerRadius = 5.0f;
    [button setTitle:@"Done" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(80);
        make.height.offset(50);
        make.center.equalTo(self);
    }];
    
    RACSignal *singnalIndex = RACObserve(self, index);
    RACSignal *singnalTitle = RACObserve(self, title);
    
    [[RACSignal combineLatest:@[singnalIndex, singnalTitle] reduce:^(id index, NSString *title){
        return [NSString stringWithFormat:@"%@-%@", title, index];
    }] subscribeNext:^(NSString *x) {
        [button setTitle:x forState:UIControlStateNormal];
    }];
    
}

@end
