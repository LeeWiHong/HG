//
//  HGRegisterMainController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/13.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGRegisterMainController.h"
#import "HGRegisterView.h"
#import "HGRegSetMainController.h"
#import <SMS_SDK/SMSSDK.h>

@interface HGRegisterMainController ()
@property(nonatomic,weak) HGRegisterView *RegisterView;

@property(nonatomic,copy) NSString *PhoneNumber;

@property(nonatomic,strong) MBProgressHUD *HUD;

@end

@implementation HGRegisterMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:HGWhite];
    [self setUpRegisterBodyView];
}

#pragma mark - 初始化注册视图

- (void) setUpRegisterBodyView
{
    HGRegisterView *RegisterView = [[HGRegisterView alloc] init];
    [RegisterView.GetCodeBtn addTarget:self action:@selector(GetMessageCode) forControlEvents:UIControlEventTouchUpInside];
    [RegisterView.LoginBtn addTarget:self action:@selector(RegisterGetCodeResult) forControlEvents:UIControlEventTouchUpInside];
    self.PhoneNumber = RegisterView.PhoneField.text;
    self.RegisterView = RegisterView;
    [self.view addSubview:RegisterView];
    
    [RegisterView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(0);
        make.left.equalTo(self.view.left).offset(0);
        make.bottom.equalTo(self.view.bottom).offset(0);
        make.right.equalTo(self.view.right).offset(0);
    }];
}

#pragma mark - 跳转到注册设置界面

- (void) Jump2RegSetVCWithPublickKey:(NSString *)PublickKey WithTelephone:(NSString *)telephone
{
    HGRegSetMainController *RegSetVC = [[HGRegSetMainController alloc] init];
    RegSetVC.navigationItem.title = @"设置";
    RegSetVC.PublickKey = PublickKey;
    RegSetVC.telephone = telephone;
    RegSetVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:RegSetVC animated:YES];
}

#pragma mark - 获取验证码

- (void) GetMessageCode
{
    [self.view endEditing:YES];
    HGHUD *hud = [[HGHUD alloc] initWithView:self.view];
    if ([HGExpressTools isValidPhone:self.RegisterView.PhoneField.text]) {
        [hud ShowWaitWithState:@"正在获取短信..." Excute:^{
            [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.RegisterView.PhoneField.text zone:@"86" template:nil result:^(NSError *error) {
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

#pragma mark - 注册点击

- (void) RegisterGetCodeResult
{
    [self.view endEditing:YES];
    HGHUD *hud = [[HGHUD alloc] initWithView:self.view];
    [hud ShowWaitWithState:@"网络请求中..." Excute:^{
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setValue:self.RegisterView.PhoneField.text forKey:@"telephone"];
        [dict setValue:self.RegisterView.CodeField.text forKey:@"code"];
        [HGNetworkUtils ConnectWithMeThod:GET Url:VERIFICODE Parameters:dict Success:^(NSDictionary *data) {
            NSLog(@"1111%@",data);
            if ([data valueForKey:@"success"]) {
//                跳转到注册设置界面
                [self Jump2RegSetVCWithPublickKey:[[data valueForKey:@"data"] valueForKey:@"publickey"] WithTelephone:self.RegisterView.PhoneField.text];
            }
            else{
//                弹框提示验证码不正确
                [hud ShowToastWithState:[data valueForKey:@"msg"] Complete:^{
                    [hud DissmissWaiting];
                }];
            }
        } Failure:^(NSError *error) {
            NSLog(@"-----%@",error);
        }];
    } Complete:^{
        [hud DissmissWaiting];
    }];
    hud = nil;
}


@end
