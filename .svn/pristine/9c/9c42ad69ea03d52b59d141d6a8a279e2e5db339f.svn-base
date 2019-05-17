//
//  UIBarButtonItem+HGBarButtonItem.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/10.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "UIBarButtonItem+HGBarButtonItem.h"

@implementation UIBarButtonItem (HGBarButtonItem)

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:image forState:UIControlStateNormal];
    [leftButton setImage:highImage forState:UIControlStateHighlighted];
    // 自适应尺寸:自动根据按钮图片和文字计算按钮大小
    [leftButton sizeToFit];
    [leftButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
}

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:image forState:UIControlStateNormal];
    [leftButton setImage:selImage forState:UIControlStateSelected];
    // 自适应尺寸:自动根据按钮图片和文字计算按钮大小
    [leftButton sizeToFit];
    [leftButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
}

+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action norColor:(UIColor *)norColor highColor:(UIColor *)highColor title:(NSString *)title
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 设置标题
    [backButton setTitle:title forState:UIControlStateNormal];
    
    // 设置图片
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:highImage forState:UIControlStateHighlighted];
    
    // 设置标题颜色
    [backButton setTitleColor:norColor forState:UIControlStateNormal];
    [backButton setTitleColor:highColor forState:UIControlStateHighlighted];
    
    // 自适应尺寸:自动根据按钮图片和文字计算按钮大小
    [backButton sizeToFit];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    // 设置按钮内容内边距
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    
    return  [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
}

+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action norColor:(UIColor *)norColor highColor:(UIColor *)highColor NormalTitle:(NSString *)title SelectTitle:(NSString *)SelectTitle
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 设置标题
    [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setTitle:SelectTitle forState:UIControlStateSelected];
    
    // 设置图片
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:highImage forState:UIControlStateHighlighted];
    
    // 设置标题颜色
    [backButton setTitleColor:norColor forState:UIControlStateNormal];
    [backButton setTitleColor:highColor forState:UIControlStateHighlighted];
    
    // 自适应尺寸:自动根据按钮图片和文字计算按钮大小
    [backButton sizeToFit];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    // 设置按钮内容内边距
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    
    return  [[UIBarButtonItem alloc] initWithCustomView:backButton];
}


@end
