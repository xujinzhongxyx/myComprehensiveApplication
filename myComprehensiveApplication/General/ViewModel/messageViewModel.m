//
//  messageViewModel.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/16.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "messageViewModel.h"

@implementation messageViewModel

-(instancetype)initWithMode:(LSBaseModel *)mode
{
    if (self=[super initWithMode:mode]) {
        [self bingWithModel:mode];
    }
    
    return self;
}

-(void)bingWithModel:(LSBaseModel *)model
{
    RACSignal *single = [RACSignal return:model];
    //图片
    self.signalImage = [single map:^id (LSBaseModel *x) {
        return [UIImage imageNamed:x.objImage];
    }];
    //名称
    self.signalTitle = [single map:^id (LSBaseModel *x) {
        return x.Title;
    }];
    //描述
    self.signalDescription = [single map:^id (LSBaseModel *x) {
        return x.Description;
    }];
    //日期
    self.signalDate = [single map:^id (LSBaseModel *x) {
        return x.Date;
    }];
}

@end
