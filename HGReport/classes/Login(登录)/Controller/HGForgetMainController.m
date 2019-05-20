//
//  HGForgetMainController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/13.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGForgetMainController.h"
#import <SMS_SDK/SMSSDK.h>
#import "HGForgetView.h"

@interface HGForgetMainController ()

@property(nonatomic,weak) HGForgetView *ForgetView;
@end

@implementation HGForgetMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:HGWhite];
    [self setUpForgetBodyView];
}

#pragma mark - 初始化忘记视图

- (void) setUpForgetBodyView
{
    HGForgetView *ForgetView = [[HGForgetView alloc] init];
    
    [ForgetView.GetCodeBtn addTarget:self action:@selector(GetMessageCode) forControlEvents:UIControlEventTouchUpInside];
    [ForgetView.FinishBtn addTarget:self action:@selector(FinishBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.ForgetView = ForgetView;
    [self.view addSubview:ForgetView];
    
    [ForgetView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(0);
        make.left.equalTo(self.view.left).offset(0);
        make.bottom.equalTo(self.view.bottom).offset(0);
        make.right.equalTo(self.view.right).offset(0);
    }];
}

#pragma mark - 更改密码

- (void) FinishBtnClick
{
    [self.view endEditing:YES];
    HGHUD *hud = [[HGHUD alloc] initWithView:self.view];
    if ([HGExpressTools isValidPhone:self.ForgetView.PhoneField.text]) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setValue:self.ForgetView.PhoneField.text forKey:@"telephone"];
        [dict setValue:self.ForgetView.CodeField.text forKey:@"code"];
        [dict setValue:[RSA encryptString:self.ForgetView.NewPasswordField.text publicKey:[HGDefaults valueForKey:@"publickey"]] forKey:@"newpassword"];
        [self.Connection ConnectWithMeThod:GET Url:UPDATEPASSWORD Parameters:dict Success:^(NSDictionary *data) {
            if ([[data valueForKey:@"success"] boolValue]) {
                [HGDefaults setValue:[[data valueForKey:@"data"] valueForKey:@"token"]forKey:@"token"];
                [self Jump2BackVC];
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
    }
    else{
        [hud ShowToastWithState:@"请输入正确的手机号码..." Complete:^{
            [hud DissmissWaiting];
        }];
    }
    hud = nil;
}

#pragma mark - 获取验证码

- (void) GetMessageCode
{
    [self.view endEditing:YES];
    HGHUD *hud = [[HGHUD alloc] initWithView:self.view];
    if ([HGExpressTools isValidPhone:self.ForgetView.PhoneField.text]) {
        [hud ShowWaitWithState:@"正在获取短信..." Excute:^{
            [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.ForgetView.PhoneField.text zone:@"86" template:nil result:^(NSError *error) {
                if (!error) {
                    [self ConnectionGetPublicKeyWithHud:hud];
                }
                else
                {
                    [hud ShowWaitWithState:@"获取失败"];
                    NSLog(@"获取失败");
                }
            }
             ];
        } Complete:^{
            [hud DissmissWaiting];
        }];
    }
    else{
        [hud ShowToastWithState:@"请输入正确的手机号码..." Complete:^{
            [hud DissmissWaiting];
        }];
    }
    hud = nil;
}

#pragma mark - 获取公钥m

- (void) ConnectionGetPublicKeyWithHud:(HGHUD *)hud
{
    [self.Connection ConnectWithMeThod:GET Url:GETPUBLICKEY Parameters:nil Success:^(NSDictionary *data) {
        if ([[data valueForKey:@"success"] boolValue]) {
            [HGDefaults setValue:[[data valueForKey:@"data"] valueForKey:@"publickey"]forKey:@"publickey"];
            [hud ShowToastWithState:@"获取成功..." Complete:^{
                [hud DissmissWaiting];
            }];
        }
    } Failure:^(NSError *error) {
        [hud ShowToastWithState:@"网络连接失败..." Complete:^{
            [hud DissmissWaiting];
        }];
    }];
}

#pragma mark - 跳转回上一个界面

- (void) Jump2BackVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
