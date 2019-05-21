//
//  HGHomeTabCell.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/21.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGHomeTabCell.h"

@interface HGHomeTabCell ()

@property(nonatomic,weak) UILabel *PlatLabel;

@property(nonatomic,weak) UILabel *ArticleCat;

@property(nonatomic,weak) UILabel *ArticleTitle;

@property(nonatomic,weak) UIImageView *ArticleImage;
@end

@implementation HGHomeTabCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpHomeTabCellView];
    }
    return self;
}

#pragma mark - 初始化cell的视图

- (void) setUpHomeTabCellView
{
    UIImageView *ArticleImage = [[UIImageView alloc] init];
    ArticleImage.image = [UIImage imageNamed:@"android"];
    self.ArticleImage = ArticleImage;
    [self addSubview:ArticleImage];
    
    [ArticleImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(20 * HGAutoHeight);
        make.right.equalTo(self.right).offset(-30 * HGAutoWidth);
        make.bottom.equalTo(self.bottom).offset(-20 * HGAutoHeight);
        make.width.mas_equalTo(self.height);
    }];
    
    UILabel *ArticleTitle = [UILabel LabelWithFone:14 Color:HGBlack];
    ArticleTitle.text = @"SpaceX载人飞船成功首飞,人类载人航天进入新纪元";
    ArticleTitle.numberOfLines = 2;
    ArticleTitle.lineBreakMode = NSLineBreakByTruncatingTail;
    self.ArticleTitle = ArticleTitle;
    [self addSubview:ArticleTitle];
    
    [ArticleTitle makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ArticleImage.top).offset(0);
        make.left.equalTo(self.left).offset(30 * HGAutoWidth);
        make.right.equalTo(ArticleImage.left).offset(-20 * HGAutoWidth);
    }];
    
    UILabel *ArticleCat = [UILabel LabelWithFone:12 Color:HGBlack BoolFont:YES];
    ArticleCat.text = @"Java";
    self.ArticleCat = ArticleCat;
    [self addSubview:ArticleCat];
    
    [ArticleCat makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(30 * HGAutoWidth);
        make.bottom.equalTo(ArticleImage.bottom).offset(0);
    }];
    
    UILabel *PlatLabel = [UILabel LabelWithFone:12 Color:HGRED BoolFont:YES];
    PlatLabel.text = @"掘金";
    self.PlatLabel = PlatLabel;
    [self addSubview:PlatLabel];
    
    [PlatLabel makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ArticleImage.bottom).offset(0);
        make.left.equalTo(ArticleCat.right).offset(20 * HGAutoWidth);
    }];
    
    UIView *BottomSepLine = [[UIView alloc] init];
    BottomSepLine.backgroundColor = [UIColor colorWithHexString:HGWhiteGray];
    [self addSubview:BottomSepLine];
    
    [BottomSepLine makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(0);
        make.bottom.equalTo(self.bottom).offset(0);
        make.right.equalTo(self.right).offset(0);
        make.height.mas_equalTo(1);
    }];
    
}

@end
