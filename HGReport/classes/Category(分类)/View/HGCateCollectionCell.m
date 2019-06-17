//
//  HGCateCollectionCell.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/21.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGCateCollectionCell.h"
#import "HGCateModel.h"

@interface HGCateCollectionCell ()

@property(nonatomic,weak) UIImageView *ItemImage;

@property(nonatomic,weak) UILabel *ItemLabel;

@end

@implementation HGCateCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithHexString:HGWhite];
        [self setUpCateCollectionItem];
    }
    return self;
}

#pragma mark - 初始化item

- (void) setUpCateCollectionItem
{
    UIImageView *ItemImage = [[UIImageView alloc] init];
    ItemImage.contentMode = UIViewContentModeScaleAspectFit;
    [ItemImage sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"android"]];
    self.ItemImage = ItemImage;
    [self addSubview:ItemImage];
    
    [ItemImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(10);
        make.left.equalTo(self.left).offset(0);
        make.right.equalTo(self.right).offset(0);
        make.height.mas_equalTo(self.width);
    }];
    
    UILabel *ItemLabel = [UILabel LabelWithFone:16 Color:HGBlack];
    ItemLabel.text = @"Android";
    self.ItemLabel = ItemLabel;
    [self addSubview:ItemLabel];
    
    [ItemLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.centerX).offset(0);
        make.top.equalTo(ItemImage.bottom).offset(20 * HGAutoHeight);
    }];
}

- (void)setCateModel:(HGCateModel *)CateModel
{
    [self.ItemImage sd_setImageWithURL:[NSURL URLWithString:[WEBURL stringByAppendingString:CateModel.categoryImage]] placeholderImage:[UIImage imageNamed:@"android"]];
    self.ItemLabel.text = CateModel.categoryName;
}

@end
