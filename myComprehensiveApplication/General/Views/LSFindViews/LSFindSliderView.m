//
//  LSFindSliderView.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/23.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "LSFindSliderView.h"

@interface LSFindSliderView()
{
    UILabel *lableLine;
}

@end

@implementation LSFindSliderView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self loadSubViews];
    }
    
    return self;
}

-(void)loadSubViews
{
    self.backgroundColor = [UIColor grayColor];
    
    lableLine = [[UILabel alloc] init];
    lableLine.backgroundColor = [UIColor redColor];
    [self addSubview:lableLine];
    
    NSArray *aryTitle = @[@"查询", @"缴费", @"办理", @"客服", @"生活", @"社会"];
    CGFloat height  = 80.f;
    for (NSInteger i=0; i<6; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, i*80, CGRectGetWidth(self.bounds), height)];
        button.tag = i;
        button.backgroundColor = [UIColor grayColor];
        [button setTitle:aryTitle[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

-(void)clickMe:(UIButton *)button
{
    [_clickIndexSubject sendNext:@{@"title":button.currentTitle, @"index":@(button.tag)}];
    [button setBackgroundColor:[UIColor whiteColor]];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    for (id  object in [self subviews]) {
        if ([object isKindOfClass:[UIButton class]]) {
            UIButton *btnObject = object;
            if (button.tag!=btnObject.tag) {
                btnObject.backgroundColor = [UIColor grayColor];
                [btnObject setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }
        }
    }
    
    [self bringSubviewToFront:lableLine];
    [lableLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.height.equalTo(button);
        make.width.offset(2);
    }];
}

-(RACSubject *)clickIndexSubject
{
    if (!_clickIndexSubject) {
        _clickIndexSubject = [RACSubject subject];
    }
    
    return _clickIndexSubject;
}

@end
