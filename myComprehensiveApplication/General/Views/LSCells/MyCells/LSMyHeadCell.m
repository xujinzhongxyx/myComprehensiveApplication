//
//  LSMyCell.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/16.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "LSMyHeadCell.h"
#import "myViewModel.h"

@interface LSMyHeadCell()

@property(strong, nonatomic) UIImageView *headImageView;
@property(strong, nonatomic) UILabel *labName;
@property(strong, nonatomic) UILabel *labMail;

@end

@implementation LSMyHeadCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier 
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubViews];
    }
    
    return self;
}

-(void)bingWithViewModel:(myViewModel *)viewModel
{
    RAC(self.headImageView, image) = viewModel.my_signalheadImage;
    RAC(self.labName, text) = viewModel.my_signalname;
    RAC(self.labMail, text) = viewModel.my_signalmail;
}

-(void)loadSubViews
{
    _headImageView = [[UIImageView alloc] init];
    _headImageView.layer.cornerRadius = 5.0f;
    _headImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:_headImageView];
    
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(60);
        make.left.equalTo(self.contentView).offset(5);
        make.centerY.equalTo(self.contentView);
    }];
    
    _labName = [[UILabel alloc] init];
    _labName.font = [UIFont systemFontOfSize:16.f];
    _labName.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_labName];
    
    [_labName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.contentView).offset(-70);
        make.height.offset(40);
        make.top.equalTo(_headImageView.mas_top);
        make.left.equalTo(_headImageView.mas_right).offset(5);
    }];
    
    _labMail = [[UILabel alloc] init];
    _labMail.font = [UIFont systemFontOfSize:14.f];
    _labMail.textAlignment = NSTextAlignmentLeft;
    _labMail.textColor = [UIColor grayColor];
    [self.contentView addSubview:_labMail];
    
    [_labMail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(_labName);
        make.height.offset(10);
        make.bottom.equalTo(_headImageView).offset(-10);
    }];
    
}

@end
