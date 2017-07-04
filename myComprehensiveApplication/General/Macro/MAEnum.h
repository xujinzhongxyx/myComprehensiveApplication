//
//  MAEnum.h
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/15.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#ifndef MAEnum_h
#define MAEnum_h

typedef NS_ENUM(NSInteger, NavigationType)
{
    navMessageType      =   1,  //消息
    navAddressBookType  =   2,  //通讯录
    navFindType         =   3,  //发现
    navMyType           =   4,  //我
};

#define kmessageClassName       @"CAmessageViewController"
#define kaddressBookClassName   @"CAaddressBookViewController"
#define kfindClassName          @"CAfindViewController"
#define kmyClassName            @"CAmyViewController"

#endif /* MAEnum_h */


