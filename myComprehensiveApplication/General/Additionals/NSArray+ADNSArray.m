//
//  NSArray+ADNSArray.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/21.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "NSArray+ADNSArray.h"

@implementation NSArray (ADNSArray)

+(void)load
{
    //NSArray
    Method objectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
    Method objectWithIndex = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectWithIndex:));
    method_exchangeImplementations(objectAtIndex, objectWithIndex);
}

-(id)objectWithIndex:(NSUInteger)index
{
    if (index <self.count) {
        return [self objectWithIndex:index];
    }else{
        return nil;
    }
}

@end
