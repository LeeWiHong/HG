//
//  HGCateCollectionCell.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/21.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGCateCollectionCell.h"

@interface HGCateCollectionCell ()



@end

@implementation HGCateCollectionCell

- (instancetype)init
{
    if (self == [super init]) {
        [self setUpCateCollectionItem];
    }
    return self;
}

#pragma mark - 初始化item

- (void) setUpCateCollectionItem
{
    UIImageView *ItemImage = [[UIImageView alloc] init];
    ItemImage.image = [UIImage imageNamed:@"defaulthead"];
    self.ItemImage = ItemImage;
    [self addSubview:ItemImage];
    
    [ItemImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(0);
        make.left.equalTo(self.left).offset(0);
        make.right.equalTo(self.right).offset(0);
        make.width.mas_equalTo(self.height);
    }];
    
    UILabel *ItemLabel = [UILabel LabelWithFone:14 Color:HGBlack];
    ItemLabel.text = @"Android";
    self.ItemLabel = ItemLabel;
    [self addSubview:ItemLabel];
    
    [ItemLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.centerX).offset(0);
        make.top.equalTo(ItemImage.bottom).offset(20 * HGAutoHeight);
    }];
    
}

@end
