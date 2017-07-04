//
//  findView.h
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/22.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSFindView : UIView

@property(strong, nonatomic) RACSubject *subjectColor;
@property(strong, nonatomic) RACSubject *subjectClean;

@property(strong, nonatomic) RACCommand *commandColor;
@property(strong, nonatomic) RACCommand *commandClean;

@end
