//
//  BaseViewModel.h
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/16.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSBaseModel.h"

@interface BaseViewModel : NSObject

/** 聊天 */
@property(strong, nonatomic) RACSignal *signalDescription;  //描述
@property(strong, nonatomic) RACSignal *signalDate;         //日期
@property(strong, nonatomic) RACSignal *signalImage;        //图片
@property(strong, nonatomic) RACSignal *signalTitle;        //名称

- (instancetype)initWithMode:(LSBaseModel *)mode;

@end
