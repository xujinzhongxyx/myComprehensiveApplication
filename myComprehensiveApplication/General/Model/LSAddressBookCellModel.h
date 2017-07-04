//
//  LSAddressBookCellModel.h
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/16.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSAddressBookCellModel : LSBaseModel

//头像
@property(strong, nonatomic) NSString *headImage;
//姓名
@property(strong, nonatomic) NSString *name;

@end
