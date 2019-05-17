//
//  HGLoginMainController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/12.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGLoginMainController.h"
#import "HGLoginView.h"
#import "HGRegisterMainController.h"
#import "HGForgetMainController.h"

@interface HGLoginMainController ()

@end

@implementation HGLoginMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登录";
    self.view.backgroundColor = [UIColor colorWithHexString:HGWhite];
    [self setUpLoginBodyView];
}

#pragma mark - 初始化主体视图

- (void) setUpLoginBodyView
{
    HGLoginView *LoginView = [[HGLoginView alloc] init];
    [LoginView.RegisterBtn addTarget:self action:@selector(Jump2RegisterVC) forControlEvents:UIControlEventTouchUpInside];
    [LoginView.ForgetBtn addTarget:self action:@selector(Jump2ForgetVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:LoginView];
    
    [LoginView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(0);
        make.left.equalTo(self.view.left).offset(0);
        make.bottom.equalTo(self.view.bottom).offset(0);
        make.right.equalTo(self.view.right).offset(0);
    }];
}

#pragma mark - 跳转到注册界面

- (void) Jump2RegisterVC
{
    HGRegisterMainController *RegisterVC = [[HGRegisterMainController alloc] init];
    RegisterVC.navigationItem.title = @"注册";
    RegisterVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:RegisterVC animated:YES];
}

#pragma mark - 跳转到忘记密码界面

- (void) Jump2ForgetVC
{
    HGForgetMainController *ForgetVC = [[HGForgetMainController alloc] init];
    ForgetVC.navigationItem.title = @"重置密码";
    ForgetVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:ForgetVC animated:YES];
}

@end
