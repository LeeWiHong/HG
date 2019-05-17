//
//  UILabel+HGLabel.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/11.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "UILabel+HGLabel.h"

@implementation UILabel (HGLabel)

+ (UILabel *)LabelWithFone:(NSInteger)FontSize Color:(NSString *)ColorString
{
    return [self LabelWithFone:FontSize Color:ColorString BoolFont:NO];
}
+ (UILabel *)LabelWithFone:(NSInteger)FontSize Color:(NSString *)ColorString BoolFont:(BOOL) BoolFont
{
    UILabel *Label = [[UILabel alloc] init];
    if (BoolFont) {
        [Label setFont:[UIFont boldSystemFontOfSize:FontSize]];
    }
    else{
        [Label setFont:[UIFont systemFontOfSize:FontSize]];
    }
    Label.textColor = [UIColor colorWithHexString:ColorString];
    return Label;
    
}
@end
