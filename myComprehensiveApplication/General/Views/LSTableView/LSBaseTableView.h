//
//  LSBaseTableView.h
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/16.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSBaseTableView : UITableView

@property(strong, nonatomic) RACCommand  *headerCommand;
@property(strong, nonatomic) RACCommand  *footerCommand;

@end
