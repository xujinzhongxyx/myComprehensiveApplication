//
//  addressBookViewModel.h
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/16.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface addressBookViewModel : BaseViewModel

//头像信号
@property(strong, nonatomic) RACSignal *signalHeadImage;
//姓名信号
@property(strong, nonatomic) RACSignal *signalName;

@end
