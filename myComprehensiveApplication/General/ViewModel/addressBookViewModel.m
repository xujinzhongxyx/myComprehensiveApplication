//
//  addressBookViewModel.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/16.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "addressBookViewModel.h"
#import "LSAddressBookCellModel.h"

@implementation addressBookViewModel

-(instancetype)initWithMode:(LSBaseModel *)mode
{
    if (self = [super initWithMode:mode]) {
        [self bingWithViewModel:mode];
    }
    
    return self;
}

-(void)bingWithViewModel:(LSBaseModel *)model
{
    if ([model isKindOfClass:[LSAddressBookCellModel class]]) {
        
        RACSignal *signal = [RACSignal return:model];
    
        self.signalHeadImage = [signal map:^id (LSAddressBookCellModel *x) {
            return [UIImage imageNamed:x.headImage];
        }];
        
        self.signalName = [signal map:^id (LSAddressBookCellModel *x) {
            return x.name;
        }];
    }
}

@end
