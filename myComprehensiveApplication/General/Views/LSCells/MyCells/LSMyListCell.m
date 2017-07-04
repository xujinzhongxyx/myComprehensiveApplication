//
//  LSMyListCell.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/20.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "LSMyListCell.h"
#import "myViewModel.h"

@interface LSMyListCell()

@property(strong, nonatomic) UIImageView *headImage;
@property(strong, nonatomic) UILabel *lableTitle;

@end

@implementation LSMyListCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubViews];
    }
    
    return self;
}

-(void)loadSubViews
{
    _headImage = [[UIImageView alloc] init];
    _headImage.layer.cornerRadius = 5.0f;
    _headImage.layer.masksToBounds = YES;
    [self.contentView addSubview:_headImage];
    
    [_headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(5);
        make.width.height.offset(30);
        make.centerY.equalTo(self.contentView);
    }];
    
    _lableTitle = [[UILabel alloc] init];
    _lableTitle.textAlignment = NSTextAlignmentLeft;
    _lableTitle.font = [UIFont systemFontOfSize:16.f];
    [self.contentView addSubview:_lableTitle];
    
    [_lableTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.contentView).offset(-50);
        make.height.offset(30);
        make.left.equalTo(_headImage.mas_right).offset(15);
        make.centerY.equalTo(_headImage);
    }];
}

-(void)bingWithViewModel:(myViewModel *)viewModel
{
    RAC(self.headImage, image) = viewModel.my_signalListImage;
    RAC(self.lableTitle, text) = viewModel.my_signalListTitle;
}

@end
