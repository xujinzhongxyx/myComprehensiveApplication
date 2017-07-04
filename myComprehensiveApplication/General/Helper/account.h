//
//  account.h
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/20.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface account : NSObject<NSCoding>

/** 用户信息 */
@property(strong, nonatomic) UIImage    *headImage;
@property(strong, nonatomic) NSString   *name;
@property(assign, nonatomic) NSNumber   *sexMan;
@property(strong, nonatomic) NSString   *mail;
@property(strong, nonatomic) NSString   *ID;
@property(strong, nonatomic) NSArray    *aryList;
@property(assign, nonatomic) NSInteger  age;


/* 实例化 **/
+(account *)share;


/* 文件归档 **/
-(void)writeAccount;

/* 文件读取 **/
+(account *)getAccount;

@end
