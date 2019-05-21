//
//  HGHomeNavView.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/21.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGHomeNavView.h"

@implementation HGHomeNavView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self setUpHomeNavView];
    }
    return self;
}

#pragma mark - 初始化导航栏视图

- (void) setUpHomeNavView
{
    UIView *NavPlaceView = [[UIView alloc] init];
    [self addSubview:NavPlaceView];
    
    [NavPlaceView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(0);
        make.bottom.equalTo(self.bottom).offset(0);
        make.right.equalTo(self.right).offset(0);
        make.height.mas_equalTo(44);
    }];
    
    UILabel *NavLabel = [UILabel LabelWithFone:18 Color:HGWhite];
    NavLabel.text = @"鸿哥日报";
    [NavPlaceView addSubview:NavLabel];
    
    [NavLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(NavPlaceView.centerX).offset(0);
        make.centerY.equalTo(NavPlaceView.centerY).offset(0);
    }];
    
}

@end
