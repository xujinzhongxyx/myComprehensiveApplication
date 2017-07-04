//
//  LStabBarView.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/15.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "LStabBarView.h"

@implementation LStabBarView

- (instancetype)init:(UIView *)view
{
    if (self=[super initWithFrame:CGRectMake(0, CGRectGetHeight(view.bounds)-70, CGRectGetWidth(view.bounds), 70)]) {
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
//        [self addArc];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    //中间镂空的矩形框
    CGRect myRect =CGRectMake(0, 0, CGRectGetWidth(self.bounds), 20);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //背景色
    [[UIColor colorWithWhite:0 alpha:0.3] set];
    CGContextAddRect(ctx, rect);
    CGContextFillPath(ctx);
    
    CGContextSetBlendMode(ctx, kCGBlendModeClear);
    
    CGContextAddRect(ctx, myRect);
    
    //填充
    CGContextFillPath(ctx);
}

- (void)addArc {
    //中间镂空的矩形框
    CGRect myRect =CGRectMake(0, 0, CGRectGetWidth(self.bounds), 20);
    
    //背景
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:[UIScreen mainScreen].bounds cornerRadius:0];
    //镂空
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:myRect];
    [path appendPath:circlePath];
    [path setUsesEvenOddFillRule:YES];
    
    CAShapeLayer *fillLayer = [CAShapeLayer layer];
    fillLayer.path = path.CGPath;
    fillLayer.fillRule = kCAFillRuleEvenOdd;
    fillLayer.fillColor = [UIColor whiteColor].CGColor;
    fillLayer.opacity = 0.5;
    [self.layer addSublayer:fillLayer];
}

@end
