//
//  LSAddressBookCell.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/16.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "LSAddressBookCell.h"
#import "addressBookViewModel.h"

@interface LSAddressBookCell()

@end


@implementation LSAddressBookCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubViews];
    }
    
    return self;
}

-(void)loadSubViews
{
    _headImage = [[UIImageView alloc] init];
    _headImage.layer.cornerRadius = 5.0f;
    [self.contentView addSubview:_headImage];
    
    [_headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(5);
        make.width.height.offset(40);
        make.centerY.equalTo(self.contentView);
    }];
    
    _name = [[UILabel alloc] init];
    _name.font = [UIFont systemFontOfSize:16.f];
    [self.contentView addSubview:_name];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headImage.mas_right).offset(10);
        make.width.equalTo(self.contentView).offset(-60);
        make.height.offset(30);
        make.centerY.equalTo(_headImage);
    }];
}


-(void)bingWithViewModel:(BaseViewModel *)viewModel
{
    if ([viewModel isKindOfClass:[addressBookViewModel class]]) {
        addressBookViewModel *viewaddModel = (addressBookViewModel *)viewModel;
        RAC(self.headImage, image) = viewaddModel.signalHeadImage;
        RAC(self.name, text) = viewaddModel.signalName;
    }
}

@end
