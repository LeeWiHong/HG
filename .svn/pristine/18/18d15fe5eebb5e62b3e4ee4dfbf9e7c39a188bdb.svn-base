//
//  HGRegSetView.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/13.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGRegSetView.h"

@implementation HGRegSetView

- (instancetype)init
{
    if (self == [super init]) {
        [self setUpRegSetBodyView];
    }
    return self;
}

#pragma mark - 初始化注册设置视图

- (void) setUpRegSetBodyView
{
    UITextField *UserNameField = [[UITextField alloc] init];
    UserNameField.placeholder = @"用户名";
    UserNameField.borderStyle = UITextBorderStyleRoundedRect;
    UserNameField.textAlignment = NSTextAlignmentLeft;
    UserNameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    UserNameField.keyboardType = UIKeyboardTypeDefault;
    self.UserNameField = UserNameField;
    [self addSubview:UserNameField];
    
    [UserNameField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(20 * HGAutoHeight);
        make.left.equalTo(self.left).offset(60 * HGAutoHeight);
        make.right.equalTo(self.right).offset(-60 * HGAutoHeight);
        make.height.mas_equalTo(80 * HGAutoHeight);
    }];
    
    UITextField *PasswordField = [[UITextField alloc] init];
    PasswordField.placeholder = @"密码";
    PasswordField.borderStyle = UITextBorderStyleRoundedRect;
    PasswordField.textAlignment = NSTextAlignmentLeft;
    PasswordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    PasswordField.keyboardType = UIKeyboardTypeAlphabet;
    PasswordField.secureTextEntry = YES;
    self.PasswordField = PasswordField;
    [self addSubview:PasswordField];
    
    [PasswordField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(UserNameField.bottom).offset(20 * HGAutoHeight);
        make.left.equalTo(self.left).offset(60 * HGAutoHeight);
        make.right.equalTo(self.right).offset(-60 * HGAutoHeight);
        make.height.mas_equalTo(80 * HGAutoHeight);
    }];
    
    UITextField *REPasswordField = [[UITextField alloc] init];
    REPasswordField.placeholder = @"重复密码";
    REPasswordField.borderStyle = UITextBorderStyleRoundedRect;
    REPasswordField.textAlignment = NSTextAlignmentLeft;
    REPasswordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    REPasswordField.keyboardType = UIKeyboardTypeAlphabet;
    REPasswordField.secureTextEntry = YES;
    self.REPasswordField = REPasswordField;
    [self addSubview:REPasswordField];
    
    [REPasswordField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(PasswordField.bottom).offset(20 * HGAutoHeight);
        make.left.equalTo(self.left).offset(60 * HGAutoHeight);
        make.right.equalTo(self.right).offset(-60 * HGAutoHeight);
        make.height.mas_equalTo(80 * HGAutoHeight);
    }];
    
    UIButton *RegisterBtn = [UIButton BtnWithImage:nil NormalTitle:@"注  册" NormalTitleColor:HGRED TitleFont:18 BoolTitleFont:YES];
    RegisterBtn.layer.cornerRadius = 5;
    RegisterBtn.layer.borderWidth = 1;
    RegisterBtn.layer.borderColor = [[UIColor colorWithHexString:HGWhiteGray] CGColor];
    self.RegisterBtn = RegisterBtn;
    [self addSubview:RegisterBtn];
    
    [RegisterBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(REPasswordField.bottom).offset(40 * HGAutoHeight);
        make.left.equalTo(PasswordField.left).offset(0);
        make.right.equalTo(PasswordField.right).offset(0);
        make.height.mas_equalTo(80 * HGAutoHeight);
    }];
    
    
    
}

@end
