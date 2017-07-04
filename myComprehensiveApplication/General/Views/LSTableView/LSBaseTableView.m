//
//  LSBaseTableView.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/16.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "LSBaseTableView.h"

@implementation LSBaseTableView

-(instancetype) initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self=[super initWithFrame:frame style:style]) {
        [self setupRefresh];
    }
    
    return self;
}

- (void)setupRefresh
{
    //下拉刷新
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.headerCommand execute:@1];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.mj_header endRefreshing];
        });
    }];
    
    //上拉刷新
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.footerCommand execute:@1];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.mj_footer endRefreshing];
        });
    }];
}

- (RACCommand *)headerCommand
{
    if(!_headerCommand){
        _headerCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                [subscriber sendNext:@1];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    
    return _headerCommand;
}

- (RACCommand *)footerCommand
{
    if (!_footerCommand) {
        _footerCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                [subscriber sendNext:@1];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    
    return _footerCommand;
}



@end
