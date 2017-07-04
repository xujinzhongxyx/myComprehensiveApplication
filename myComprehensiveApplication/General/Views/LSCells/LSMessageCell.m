//
//  LSMessageCell.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/16.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "LSMessageCell.h"

@interface LSMessageCell()

@property(strong, nonatomic) UIImageView  *imgView;    //图片
@property(strong, nonatomic) UILabel   *lableTitle;          //名称
@property(strong, nonatomic) UILabel   *lableDescription;    //描述
@property(strong, nonatomic) UILabel   *lableDate;           //日期

@end

@implementation LSMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self stupSubView];
    }
    
    return self;
}

- (void) stupSubView
{
    _imgView = [[UIImageView alloc] init];
    _imgView.layer.cornerRadius = 5.0f;
    [self.contentView addSubview:_imgView];
    
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(55);
        make.centerY.equalTo(self.contentView);
        make.left.offset(5);
    }];
    
    _lableTitle = [[UILabel alloc] init];
    _lableTitle.font = [UIFont systemFontOfSize:18.f];
    _lableTitle.textColor = [UIColor blackColor];
    _lableTitle.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_lableTitle];
    
    [_lableTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imgView.mas_right).offset(5);
        make.top.equalTo(_imgView.mas_top).offset(2);
        make.width.equalTo(self.contentView).offset(-180);
        make.height.offset(30);
    }];
    
    _lableDescription = [[UILabel alloc] init];
    _lableDescription.font = [UIFont systemFontOfSize:14.f];
    _lableDescription.textColor = [UIColor blackColor];
    _lableDescription.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_lableDescription];
    
    [_lableDescription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lableTitle.mas_bottom);
        make.left.equalTo(_lableTitle);
        make.width.equalTo(_lableTitle);
        make.height.offset(30);
    }];
    
    _lableDate = [[UILabel alloc] init];
    _lableDate.font = [UIFont systemFontOfSize:14.f];
    _lableDate.textColor = [UIColor blackColor];
    
    _lableDate.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_lableDate];
    
    [_lableDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-5);
        make.width.offset(100);
        make.centerY.equalTo(_lableTitle);
    }];
}

- (void)bingWithViewModel:(BaseViewModel *)viewModel
{
    RAC(self.imgView, image) = viewModel.signalImage;
    RAC(self.lableTitle, text) = viewModel.signalTitle;
    RAC(self.lableDescription, text) = viewModel.signalDescription;
    RAC(self.lableDate, text) = viewModel.signalDate;
}

@end
