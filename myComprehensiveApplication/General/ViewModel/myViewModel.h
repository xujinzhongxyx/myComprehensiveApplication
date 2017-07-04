//
//  myViewModel.h
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/16.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myViewModel : BaseViewModel

@property(strong, nonatomic) RACSignal *my_signalheadImage;
@property(strong, nonatomic) RACSignal *my_signalname;
@property(strong, nonatomic) RACSignal *my_signalsexMan;
@property(strong, nonatomic) RACSignal *my_signalmail;
@property(strong, nonatomic) RACSignal *my_signalID;
@property(strong, nonatomic) RACSignal *my_signalListImage;
@property(strong, nonatomic) RACSignal *my_signalListTitle;

@end
