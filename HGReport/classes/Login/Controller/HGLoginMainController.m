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
#import "HGUserInfoModel.h"

@interface HGLoginMainController ()

@property(nonatomic,weak) HGLoginView *LoginView;

@end

@implementation HGLoginMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:HGWhite];
    [self setUpLoginBodyView];
}

#pragma mark - 初始化主体视图

- (void) setUpLoginBodyView
{
    HGLoginView *LoginView = [[HGLoginView alloc] init];
    [LoginView.RegisterBtn addTarget:self action:@selector(Jump2RegisterVC) forControlEvents:UIControlEventTouchUpInside];
    [LoginView.ForgetBtn addTarget:self action:@selector(Jump2ForgetVC) forControlEvents:UIControlEventTouchUpInside];
    [LoginView.LoginBtn addTarget:self action:@selector(LoginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.LoginView = LoginView;
    [self.view addSubview:LoginView];
    
    [LoginView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(0);
        make.left.equalTo(self.view.left).offset(0);
        make.bottom.equalTo(self.view.bottom).offset(0);
        make.right.equalTo(self.view.right).offset(0);
    }];
    NSLog(@"login---%@",self.Connection);
}

#pragma mark - 点击登录去获取公钥

- (void) LoginBtnClick
{
    HGHUD *hud = [[HGHUD alloc] initWithView:self.view];
    [hud ShowWaitWithState:@"正在登录中..." Excute:^{
        [self.Connection ConnectWithMeThod:GET Url:GETPUBLICKEY Parameters:nil Success:^(NSDictionary *data) {
            if ([[data valueForKey:@"success"] boolValue]) {
                [HGDefaults setValue:[[data valueForKey:@"data"] valueForKey:@"publickey"]forKey:@"publickey"];
            }
            else{
                [hud ShowToastWithState:[data valueForKey:@"msg"] Complete:^{
                    [hud DissmissWaiting];
                }];
            }
        } Failure:^(NSError *error) {
            [hud ShowToastWithState:@"网络连接失败..." Complete:^{
                [hud DissmissWaiting];
            }];
        }];
    } Complete:^{
        if ([HGExpressTools isValidPhone:self.LoginView.UserNameField.text])
        {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setValue:self.LoginView.UserNameField.text forKey:@"telephone"];
            [dict setValue:[RSA encryptString:self.LoginView.PassWordFiled.text publicKey:[HGDefaults valueForKey:@"publickey"]] forKey:@"password"];
            [self.Connection ConnectWithMeThod:GET Url:LOGIN Parameters:dict Success:^(NSDictionary *data) {
                if ([[data valueForKey:@"success"] boolValue]) {
                    HGUserInfoModel *PersonModel = [HGUserInfoModel mj_objectWithKeyValues:[data valueForKey:@"data"]];
                    [HGDefaults setValue:PersonModel.userToken forKey:@"token"];
                    [self Jump2BackVCWithUserInfo:PersonModel];
                    
                }
            } Failure:^(NSError *error) {
                [hud ShowToastWithState:@"网络连接失败..." Complete:^{
                    [hud DissmissWaiting];
                }];
            }];
        }
        else{
            [hud ShowToastWithState:@"手机号码格式不正确..." Complete:^{
                [hud DissmissWaiting];
            }];
        }
    }];
}

#pragma mark - 进行登录

- (void) Jump2BackVCWithUserInfo:(HGUserInfoModel *)PersonModel
{
    self.LoginReturn(PersonModel);
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - 跳转到注册界面

- (void) Jump2RegisterVC
{
    HGRegisterMainController *RegisterVC = [[HGRegisterMainController alloc] init];
    RegisterVC.navigationItem.title = @"注册";
    RegisterVC.hidesBottomBarWhenPushed = YES;
    RegisterVC.RegisterReturn = ^(HGUserInfoModel *UserInfoModel) {
        self.LoginReturn(UserInfoModel);
    };
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
