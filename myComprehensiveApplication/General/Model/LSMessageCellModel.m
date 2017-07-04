//
//  LSMessageCellModel.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/16.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "LSMessageCellModel.h"

@implementation LSMessageCellModel

-(void)bingWithModel:(id)model
{
    if ([model isKindOfClass:[NSDictionary class]]) {
        self.objImage = model[@"objImage"];
        self.Title = model[@"Title"];
        self.Description = model[@"Description"];
        self.Date = model[@"Date"];
    }
}

@end
