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
                    [hud ShowWaitWithState:@"获取成功"];
                    NSLog(@"获取成功了");
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

@end
