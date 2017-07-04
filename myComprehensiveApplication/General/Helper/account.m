//
//  account.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/20.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "account.h"
#import <objc/message.h>

static account *_instanceAccount  = nil;

@implementation account

+(account *)share
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instanceAccount = [account getAccount];
        if (!_instanceAccount) {
            _instanceAccount = [[account alloc] init];
        }
    });
    
    return _instanceAccount;
}

/* 文件归档 **/
-(void)writeAccount
{
    NSString *fileName = [NSTemporaryDirectory() stringByAppendingPathComponent:@"myaccount1.com"];
    [NSKeyedArchiver archiveRootObject:_instanceAccount toFile:fileName];
}

/* 文件读取 **/
+(account *)getAccount
{
    static account *myAccount = nil;
    NSString *fileName = [NSTemporaryDirectory() stringByAppendingPathComponent:@"myaccount1.com"];
    myAccount = (account *)[NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
    
    return myAccount;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
//    unsigned int count = 0;
//    Ivar *ivars = class_copyIvarList([account class], &count);
//    for (NSInteger i=0; i<count; i++) {
//        Ivar ivar = ivars[i];
//        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
//        NSLog(@"key = %@", key);
//        [aCoder encodeObject:[self valueForKey:key] forKey:key];
//    }
//    free(ivars);
    
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        // 将每个成员变量名转换为NSString对象类型
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
        // 通过成员变量名，取出成员变量的值
        id value = [self valueForKey:key];
        // 再将值归档
        [aCoder encodeObject:value forKey:key];
        //[aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
    free(ivars);

//    [aCoder encodeObject:_headImage forKey:@"headImage"];
//    [aCoder encodeObject:_name forKey:@"name"];
//    [aCoder encodeObject:_sexMan forKey:@"sexMan"];
//    [aCoder encodeObject:_mail forKey:@"mail"];
//    [aCoder encodeObject:_ID forKey:@"ID"];
//    [aCoder encodeObject:_aryList forKey:@"aryList"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super init]) {
        // 获取所有成员变量
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList([self class], &outCount);
        
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            // 将每个成员变量名转换为NSString对象类型
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            // 根据变量名解档取值，无论是什么类型
            id value = [aDecoder decodeObjectForKey:key];
            // 取出的值再设置给属性
            [self setValue:value forKey:key];
        }
        free(ivars);
//        _headImage = [aDecoder decodeObjectForKey:@"headImage"];
//        _name = [aDecoder decodeObjectForKey:@"name"];
//        _sexMan = [aDecoder decodeObjectForKey:@"sexMan"];
//        _mail = [aDecoder decodeObjectForKey:@"mail"];
//        _ID = [aDecoder decodeObjectForKey:@"ID"];
//        _aryList = [aDecoder decodeObjectForKey:@"aryList"];
    }
    
    return self;
}

@end
