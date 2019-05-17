//
//  UIButton+HGButton.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/12.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "UIButton+HGButton.h"

@implementation UIButton (HGButton)

+ (UIButton *)BtnWithImage:(NSString *)NormalImage NormalTitle:(NSString *)NormalTitle NormalTitleColor:(NSString *)NormalTitleColor TitleFont:(CGFloat)FontSize BoolTitleFont:(BOOL)TitleFontBool
{
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [Btn setImage:[UIImage imageNamed:NormalImage] forState:UIControlStateNormal];
    [Btn setTitle:NormalTitle forState:UIControlStateNormal];
    [Btn setTitleColor:[UIColor colorWithHexString:NormalTitleColor] forState:UIControlStateNormal];
    if (TitleFontBool) {
        Btn.titleLabel.font = [UIFont boldSystemFontOfSize:FontSize];
    }
    else
    {
        Btn.titleLabel.font = [UIFont systemFontOfSize:FontSize];
    }
    return Btn;
}

+ (UIButton *)BtnWithImage:(NSString *)NormalImage SelectImage:(NSString *)SelectImage NormalTitle:(NSString *)NormalTitle SelectTitle:(NSString *)SelectTitle NormalTitleColor:(NSString *)NormalTitleColor SelectTitleColor:(NSString *)SelectTitleColor TitleFont:(CGFloat)FontSize BoolTitleFont:(BOOL)TitleFontBool
{
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [Btn setTitle:NormalTitle forState:UIControlStateNormal];
    [Btn setTitle:SelectTitle forState:UIControlStateSelected];
    [Btn setImage:[UIImage imageNamed:NormalImage] forState:UIControlStateNormal];
    [Btn setImage:[UIImage imageNamed:SelectImage] forState:UIControlStateSelected];
    [Btn setTitleColor:[UIColor colorWithHexString:NormalTitleColor] forState:UIControlStateNormal];
    [Btn setTitleColor:[UIColor colorWithHexString:SelectTitleColor] forState:UIControlStateSelected];
    
    if (TitleFontBool) {
        Btn.titleLabel.font = [UIFont boldSystemFontOfSize:FontSize];
    }
    else
    {
        Btn.titleLabel.font = [UIFont systemFontOfSize:FontSize];
    }
    return Btn;
}

+ (UIButton *)BtnWithBackImage:(NSString *)NormalImage NormalTitle:(NSString *)NormalTitle NormalTitleColor:(NSString *)NormalTitleColor TitleFont:(CGFloat)FontSize BoolTitleFont:(BOOL)TitleFontBool
{
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [Btn setBackgroundImage:[UIImage imageNamed:NormalImage] forState:UIControlStateNormal];
    [Btn setTitle:NormalTitle forState:UIControlStateNormal];
    [Btn setTitleColor:[UIColor colorWithHexString:NormalTitleColor] forState:UIControlStateNormal];
    if (TitleFontBool) {
        Btn.titleLabel.font = [UIFont boldSystemFontOfSize:FontSize];
    }
    else
    {
        Btn.titleLabel.font = [UIFont systemFontOfSize:FontSize];
    }
    return Btn;
}

+ (UIButton *)BtnWithBackImage:(NSString *)NormalImage SelectBackImage:(NSString *)SelectImage NormalTitle:(NSString *)NormalTitle SelectTitle:(NSString *)SelectTitle NormalTitleColor:(NSString *)NormalTitleColor SelectTitleColor:(NSString *)SelectTitleColor TitleFont:(CGFloat)FontSize BoolTitleFont:(BOOL)TitleFontBool
{
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [Btn setBackgroundImage:[UIImage imageNamed:NormalImage] forState:UIControlStateNormal];
    [Btn setBackgroundImage:[UIImage imageNamed:SelectImage] forState:UIControlStateSelected];
    [Btn setTitleColor:[UIColor colorWithHexString:NormalTitleColor] forState:UIControlStateNormal];
    [Btn setTitleColor:[UIColor colorWithHexString:SelectTitleColor] forState:UIControlStateSelected];
    [Btn setTitle:NormalTitle forState:UIControlStateNormal];
    [Btn setTitle:SelectTitle forState:UIControlStateSelected];
    if (TitleFontBool) {
        Btn.titleLabel.font = [UIFont boldSystemFontOfSize:FontSize];
    }
    else
    {
        Btn.titleLabel.font = [UIFont systemFontOfSize:FontSize];
    }
    return Btn;
    
}

+ (UIButton *)BtnWithNormalImage:(NSString *)NormalImage NormalTitle:(NSString *)NormalTitle NormalTitleColor:(NSString *)NormalTitleColor DisableImage:(NSString *)DisableImage DisableTitle:(NSString *)DisableTitle DisableTitleColor:(NSString *)DisableTitleColor TitleFone:(CGFloat)FontSize BoolTitleFont:(BOOL)TitleFontBool
{
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [Btn setBackgroundImage:[UIImage imageNamed:NormalImage] forState:UIControlStateNormal];
    [Btn setBackgroundImage:[UIImage imageNamed:DisableImage] forState:UIControlStateDisabled];
    [Btn setTitle:NormalTitle forState:UIControlStateNormal];
    [Btn setTitle:DisableTitle forState:UIControlStateDisabled];
    [Btn setTitleColor:[UIColor colorWithHexString:NormalTitleColor] forState:UIControlStateNormal];
    [Btn setTitleColor:[UIColor colorWithHexString:DisableTitleColor] forState:UIControlStateDisabled];
    
    if (TitleFontBool) {
        Btn.titleLabel.font = [UIFont boldSystemFontOfSize:FontSize];
    }
    else{
        Btn.titleLabel.font = [UIFont systemFontOfSize:FontSize];
    }
    return Btn;
}

+ (UIButton *)BtnWithNormalImage:(NSString *)NormalImage NormalBackgroundImage:(NSString *)NormalBackgroundImage NormalTitle:(NSString *)NormalTitle NormalTitleColor:(NSString *)NormalTitleColor SelectImage:(NSString *)SelectImage SelectBackgroundImage:(NSString *)SelectBackgroundImage SelectTitle:(NSString *)SelectTitle SelectTitleColor:(NSString *)SelectTitleColor DisableImage:(NSString *)DisableImage DisableBackgroundImage:(NSString *)DisableBackgroundImage DisableTitle:(NSString *)DisableTitle DisableTitleColor:(NSString *)DisableTitleColor TitleFont:(CGFloat)FontSize BoolTitleFont:(BOOL)TitleFontBool
{
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [Btn setImage:[UIImage imageNamed:NormalImage] forState:UIControlStateNormal];
    [Btn setImage:[UIImage imageNamed:SelectImage] forState:UIControlStateSelected];
    [Btn setImage:[UIImage imageNamed:DisableImage] forState:UIControlStateDisabled];
    [Btn setTitle:NormalTitle forState:UIControlStateNormal];
    [Btn setTitle:SelectTitle forState:UIControlStateSelected];
    [Btn setTitle:DisableTitle forState:UIControlStateDisabled];
    [Btn setBackgroundImage:[UIImage imageNamed:NormalBackgroundImage] forState:UIControlStateNormal];
    [Btn setBackgroundImage:[UIImage imageNamed:SelectBackgroundImage] forState:UIControlStateSelected];
    [Btn setBackgroundImage:[UIImage imageNamed:DisableBackgroundImage] forState:UIControlStateDisabled];
    Btn.titleLabel.font = TitleFontBool ? [UIFont boldSystemFontOfSize:FontSize] : [UIFont systemFontOfSize:FontSize];
    return Btn;
    
}
@end
