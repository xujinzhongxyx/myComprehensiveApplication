//
//  LSBaseModel.h
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/16.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSBaseModel : NSObject

@property(strong, nonatomic) NSString *objImage;     //图片
@property(strong, nonatomic) NSString *Title;        //名称
@property(strong, nonatomic) NSString *Description;  //描述
@property(strong, nonatomic) NSString *Date;         //日期

- (void) bingWithModel:(id)model;

@end
