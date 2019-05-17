//
//  UIButton+HGButton.h
//  HGReport
//
//  Created by LeeWiHong on 2019/5/12.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (HGButton)
+ (UIButton *)BtnWithImage:(NSString *)NormalImage SelectImage:(NSString *)SelectImage NormalTitle:(NSString *)NormalTitle SelectTitle:(NSString *)SelectTitle NormalTitleColor:(NSString *)NormalTitleColor SelectTitleColor:(NSString *)SelectTitleColor TitleFont:(CGFloat)FontSize BoolTitleFont:(BOOL)TitleFontBool;

+ (UIButton *)BtnWithImage:(NSString *)NormalImage NormalTitle:(NSString *)NormalTitle NormalTitleColor:(NSString *)NormalTitleColor TitleFont:(CGFloat)FontSize BoolTitleFont:(BOOL)TitleFontBool;
+ (UIButton *)BtnWithBackImage:(NSString *)NormalImage NormalTitle:(NSString *)NormalTitle NormalTitleColor:(NSString *)NormalTitleColor TitleFont:(CGFloat)FontSize BoolTitleFont:(BOOL)TitleFontBool;
+ (UIButton *)BtnWithBackImage:(NSString *)NormalImage SelectBackImage:(NSString *)SelectImage NormalTitle:(NSString *)NormalTitle SelectTitle:(NSString *) SelectTitle NormalTitleColor:(NSString *)NormalTitleColor SelectTitleColor:(NSString *)SelectTitleColor TitleFont:(CGFloat)FontSize BoolTitleFont:(BOOL)TitleFontBool;

+ (UIButton *)BtnWithNormalImage:(NSString *)NormalImage NormalTitle:(NSString *)NormalTitle NormalTitleColor:(NSString *)NormalTitleColor DisableImage:(NSString *)DisableImage DisableTitle:(NSString *)DisableTitle DisableTitleColor:(NSString *)DisableTitleColor TitleFone:(CGFloat)FontSize BoolTitleFont:(BOOL)TitleFontBool;

#pragma mark - 一次性创建按钮正常、选中、dis三种状态的图片、背景图片、文字、文字颜色、大小方法

+ (UIButton *)BtnWithNormalImage:(NSString *)NormalImage NormalBackgroundImage:(NSString *)NormalBackgroundImage NormalTitle:(NSString *)NormalTitle NormalTitleColor:(NSString *)NormalTitleColor SelectImage:(NSString *)SelectImage SelectBackgroundImage:(NSString *)SelectBackgroundImage SelectTitle:(NSString *)SelectTitle SelectTitleColor:(NSString *)SelectTitleColor DisableImage:(NSString *)DisableImage DisableBackgroundImage:(NSString *)DisableBackgroundImage DisableTitle:(NSString *)DisableTitle DisableTitleColor:(NSString *)DisableTitleColor TitleFont:(CGFloat)FontSize BoolTitleFont:(BOOL)TitleFontBool;
@end

NS_ASSUME_NONNULL_END
