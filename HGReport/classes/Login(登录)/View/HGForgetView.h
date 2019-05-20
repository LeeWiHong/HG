//
//  HGForgetView.h
//  HGReport
//
//  Created by LeeWiHong on 2019/5/13.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HGForgetView : UIView

@property(nonatomic,weak) UITextField *PhoneField;

@property(nonatomic,weak) UITextField *CodeField;

@property(nonatomic,weak) UIButton *GetCodeBtn;

@property(nonatomic,weak) UITextField *NewPasswordField;

@property(nonatomic,weak) UIButton *FinishBtn;

@end

NS_ASSUME_NONNULL_END
