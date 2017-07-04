//
//  LSAddressBookCellModel.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/16.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "LSAddressBookCellModel.h"

@implementation LSAddressBookCellModel

-(void)bingWithModel:(id)model
{
    if ([model isKindOfClass:[NSDictionary class]]) {
        self.headImage = model[@"headImage"];
        self.name = model[@"name"];
    }
}

@end
