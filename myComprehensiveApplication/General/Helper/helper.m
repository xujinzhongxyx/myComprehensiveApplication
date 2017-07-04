//
//  helper.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/20.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "helper.h"

@implementation helper

+(id)getDataFromFile:(NSString *)fileName fileType:(NSString *)type
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSError *error = nil;
    
    id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error ];
    
    return object;
}

@end
