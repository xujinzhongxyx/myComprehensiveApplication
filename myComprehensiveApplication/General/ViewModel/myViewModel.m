//
//  myViewModel.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/16.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "myViewModel.h"
#import "LSMyCellModely.h"

@implementation myViewModel

-(instancetype)initWithMode:(LSMyCellModely *)mode
{
    if (self=[super initWithMode:mode]) {
        RACSignal *signal = [RACSignal return:mode];
        
        _my_signalheadImage = [signal map:^id(LSMyCellModely *x) {
            return [UIImage imageNamed:x.headImage];
        }];
        
        _my_signalname = [signal map:^id(LSMyCellModely *x) {
            return x.name;
        }];
        
        _my_signalsexMan = [signal map:^id (LSMyCellModely *x) {
            return x.sexMan;
        }];
        
        _my_signalmail = [signal map:^id(LSMyCellModely *x) {
            return x.mail;
        }];
        
        _my_signalID = [signal map:^id(LSMyCellModely *x) {
            return x.ID;
        }];
        
        _my_signalListImage = [signal map:^id(LSMyCellModely *x) {
            return [UIImage imageNamed:x.listImage];
        }];
        
        _my_signalListTitle = [signal map:^id(LSMyCellModely *x) {
            return x.listTitle;
        }];
    }
    
    return self;
}

@end
