//
//  HGForgetView.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/13.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGForgetView.h"

@implementation HGForgetView

- (instancetype)init
{
    if (self == [super init]) {
        [self setUpForgetBodyView];
    }
    return self;
}

#pragma mark - 初始化忘记body视图

- (void) setUpForgetBodyView
{
    UITextField *PhoneField = [[UITextField alloc] init];
    PhoneField.placeholder = @"请输入手机号";
    PhoneField.borderStyle = UITextBorderStyleRoundedRect;
    PhoneField.textAlignment = NSTextAlignmentLeft;
    PhoneField.clearButtonMode = UITextFieldViewModeWhileEditing;
    PhoneField.keyboardType = UIKeyboardTypeNumberPad;
    self.PhoneField = PhoneField;
    [self addSubview:PhoneField];
    
    [PhoneField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(20 * HGAutoHeight);
        make.left.equalTo(self.left).offset(60 * HGAutoHeight);
        make.right.equalTo(self.right).offset(-60 * HGAutoHeight);
        make.height.mas_equalTo(80 * HGAutoHeight);
    }];
    
    UITextField *CodeField = [[UITextField alloc] init];
    CodeField.placeholder = @"验证码";
    CodeField.borderStyle = UITextBorderStyleRoundedRect;
    CodeField.textAlignment = NSTextAlignmentLeft;
    CodeField.clearButtonMode = UITextFieldViewModeWhileEditing;
    CodeField.keyboardType = UIKeyboardTypeNumberPad;
    self.CodeField = CodeField;
    [self addSubview:CodeField];
    
    [CodeField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(PhoneField.bottom).offset(20 * HGAutoHeight);
        make.left.equalTo(self.left).offset(60 * HGAutoHeight);
        make.right.equalTo(PhoneField.centerX).offset(0);
        make.height.mas_equalTo(80 * HGAutoHeight);
    }];
    
    UIButton *GetCodeBtn = [UIButton BtnWithImage:nil NormalTitle:@"获取验证码" NormalTitleColor:HGBlack TitleFont:12 BoolTitleFont:NO];
    GetCodeBtn.layer.cornerRadius = 5;
    GetCodeBtn.layer.borderWidth = 1;
    GetCodeBtn.layer.borderColor = [[UIColor colorWithHexString:HGWhiteGray] CGColor];
    self.GetCodeBtn = GetCodeBtn;
    [self addSubview:GetCodeBtn];
    
    [GetCodeBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(CodeField.centerY).offset(0);
        make.left.equalTo(CodeField.right).offset(60 * HGAutoWidth);
        make.right.equalTo(PhoneField.right).offset(- 60 * HGAutoWidth);
        make.height.mas_equalTo(60 * HGAutoHeight);
    }];
    
    UITextField *NewPasswordField = [[UITextField alloc] init];
    NewPasswordField.placeholder = @"请输入新密码";
    NewPasswordField.borderStyle = UITextBorderStyleRoundedRect;
    NewPasswordField.textAlignment = NSTextAlignmentLeft;
    NewPasswordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    NewPasswordField.keyboardType = UIKeyboardTypeAlphabet;
    NewPasswordField.secureTextEntry = YES;
    self.NewPasswordField = NewPasswordField;
    [self addSubview:NewPasswordField];
    
    [NewPasswordField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(CodeField.bottom).offset(20 * HGAutoHeight);
        make.left.equalTo(self.left).offset(60 * HGAutoHeight);
        make.right.equalTo(self.right).offset(-60 * HGAutoHeight);
        make.height.mas_equalTo(80 * HGAutoHeight);
    }];
    
    UIButton *FinishBtn = [UIButton BtnWithImage:nil NormalTitle:@"完  成" NormalTitleColor:HGRED TitleFont:18 BoolTitleFont:YES];
    FinishBtn.layer.cornerRadius = 5;
    FinishBtn.layer.borderWidth = 1;
    FinishBtn.layer.borderColor = [[UIColor colorWithHexString:HGWhiteGray] CGColor];
    self.FinishBtn = FinishBtn;
    [self addSubview:FinishBtn];
    
    [FinishBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(NewPasswordField.bottom).offset(40 * HGAutoHeight);
        make.left.equalTo(self.left).offset(60 * HGAutoWidth);
        make.right.equalTo(self.right).offset(-60 * HGAutoWidth);
        make.height.mas_equalTo(80 * HGAutoHeight);
    }];
    
    
}

@end
