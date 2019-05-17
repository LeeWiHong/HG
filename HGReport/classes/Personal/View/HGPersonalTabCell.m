//
//  HGPersonalTabCell.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/11.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGPersonalTabCell.h"

@interface HGPersonalTabCell()

@property(nonatomic,weak) UILabel *PersonalLabel;

@end

@implementation HGPersonalTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpPersonalCellBody];
    }
    return self;
}

#pragma mark - 初始化cell视图

- (void) setUpPersonalCellBody
{
    UILabel *PersonalLabel = [UILabel LabelWithFone:14 Color:HGBlack];
    self.PersonalLabel = PersonalLabel;
    [self addSubview:PersonalLabel];
    
    [PersonalLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerY).offset(0);
        make.left.equalTo(self.left).offset(30 * HGAutoWidth);
    }];
    
    UIImageView *EnterImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_enter2"]];
    [self addSubview:EnterImageView];
    
    [EnterImageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerY).offset(0);
        make.right.equalTo(self.right).offset(-30 * HGAutoWidth);
    }];
    
    UIView *SepLineView = [[UIView alloc] init];
    SepLineView.backgroundColor = [UIColor colorWithHexString:HGWhiteGray];
    [self addSubview:SepLineView];
    
    [SepLineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(0);
        make.bottom.equalTo(self.bottom).offset(0);
        make.right.equalTo(self.right).offset(0);
        make.height.mas_equalTo(1);
    }];
}

- (void)setTitle:(NSString *)Title
{
    self.PersonalLabel.text = Title;
}

@end
