//
//  LSMyCellModely.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/16.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "LSMyCellModely.h"

@implementation LSMyCellModely

-(void)bingWithModel:(id)model
{
    if ([model isKindOfClass:[NSDictionary class]]) {
        NSDictionary *headDic = model[@"head"];
        NSDictionary *listDic = model[@"list"];
        
        self.headImage = headDic[@"headImage"];
        self.name = headDic[@"name"];
        self.sexMan = headDic[@"sexMan"];
        self.mail = headDic[@"mail"];
        self.ID = headDic[@"ID"];
        self.listImage = listDic[@"listImage"];
        self.listTitle = listDic[@"listTitle"];
    }
}

@end
