//
//  HGLoginView.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/12.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGLoginView.h"

@interface HGLoginView ()<UITextFieldDelegate>


@end

@implementation HGLoginView

- (instancetype)init
{
    if (self == [super init]) {
        [self setUpLoginBodyView];
    }
    return self;
}

#pragma mark - 初始化登录视图

- (void) setUpLoginBodyView
{
    UIView *TopSepLine = [[UIView alloc] init];
    TopSepLine.backgroundColor = [UIColor colorWithHexString:HGWhiteGray];
    [self addSubview:TopSepLine];
    
    [TopSepLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(180 * HGAutoHeight);
        make.left.equalTo(self.left).offset(0);
        make.right.equalTo(self.right).offset(0);
        make.height.mas_equalTo(1);
    }];
    
    UITextField *UserNameField = [[UITextField alloc] init];
    UserNameField.placeholder = @"请输入手机号";
    UserNameField.borderStyle = UITextBorderStyleRoundedRect;
    UserNameField.textAlignment = NSTextAlignmentLeft;
    UserNameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    UserNameField.keyboardType = UIKeyboardTypeNumberPad;
    UserNameField.delegate = self;
    self.UserNameField = UserNameField;
    [self addSubview:UserNameField];
    
    [UserNameField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(TopSepLine.bottom).offset(20 * HGAutoHeight);
        make.left.equalTo(self.left).offset(60 * HGAutoHeight);
        make.right.equalTo(self.right).offset(-60 * HGAutoHeight);
        make.height.mas_equalTo(80 * HGAutoHeight);
    }];
    
    UITextField *PassWordFiled = [[UITextField alloc] init];
    PassWordFiled.placeholder = @"请输入密码";
    PassWordFiled.borderStyle = UITextBorderStyleRoundedRect;
    PassWordFiled.textAlignment = NSTextAlignmentLeft;
    PassWordFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    PassWordFiled.keyboardType = UIKeyboardTypeAlphabet;
    PassWordFiled.secureTextEntry = YES;
    self.PassWordFiled = PassWordFiled;
    [self addSubview:PassWordFiled];
    
    [PassWordFiled makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(UserNameField.bottom).offset(20 * HGAutoHeight);
        make.left.equalTo(UserNameField.left).offset(0);
        make.right.equalTo(UserNameField.right).offset(0);
        make.height.mas_equalTo(80 * HGAutoHeight);
    }];
    
    UIView *BottomSepLine = [[UIView alloc] init];
    BottomSepLine.backgroundColor = [UIColor colorWithHexString:HGWhiteGray];
    [self addSubview:BottomSepLine];
    
    [BottomSepLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(PassWordFiled.bottom).offset(20 * HGAutoHeight);
        make.left.equalTo(self.left).offset(0);
        make.right.equalTo(self.right).offset(0);
        make.height.mas_equalTo(1);
    }];
    
    UIButton *ForgetBtn = [UIButton BtnWithImage:nil NormalTitle:@"忘记密码" NormalTitleColor:HGBlack TitleFont:12 BoolTitleFont:NO];
    ForgetBtn.layer.cornerRadius = 5;
    ForgetBtn.layer.borderWidth = 1;
    ForgetBtn.layer.borderColor = [[UIColor colorWithHexString:HGWhiteGray] CGColor];
    self.ForgetBtn = ForgetBtn;
    [self addSubview:ForgetBtn];
    
    [ForgetBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(BottomSepLine.bottom).offset(20 * HGAutoHeight);
        make.left.equalTo(PassWordFiled.left).offset(0);
        make.width.mas_equalTo(180 * HGAutoWidth);
        make.height.mas_equalTo(60 * HGAutoHeight);
    }];
    
    UIButton *RegisterBtn = [UIButton BtnWithImage:nil NormalTitle:@"注册账号" NormalTitleColor:HGBlack TitleFont:12 BoolTitleFont:NO];
    RegisterBtn.layer.cornerRadius = 5;
    RegisterBtn.layer.borderWidth = 1;
    RegisterBtn.layer.borderColor = [[UIColor colorWithHexString:HGWhiteGray] CGColor];
    self.RegisterBtn = RegisterBtn;
    [self addSubview:RegisterBtn];
    
    [RegisterBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(BottomSepLine.bottom).offset(20 * HGAutoHeight);
        make.right.equalTo(PassWordFiled.right).offset(0);
        make.width.mas_equalTo(180 * HGAutoWidth);
        make.height.mas_equalTo(60 * HGAutoHeight);
    }];
    
    UIButton *LoginBtn = [UIButton BtnWithImage:nil NormalTitle:@"登  录" NormalTitleColor:HGRED TitleFont:18 BoolTitleFont:YES];
    LoginBtn.layer.cornerRadius = 5;
    LoginBtn.layer.borderWidth = 1;
    LoginBtn.layer.borderColor = [[UIColor colorWithHexString:HGWhiteGray] CGColor];
    self.LoginBtn = LoginBtn;
    [self addSubview:LoginBtn];
    
    [LoginBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ForgetBtn.bottom).offset(40 * HGAutoHeight);
        make.left.equalTo(PassWordFiled.left).offset(0);
        make.right.equalTo(PassWordFiled.right).offset(0);
        make.height.mas_equalTo(80 * HGAutoHeight);
    }];

}


@end
