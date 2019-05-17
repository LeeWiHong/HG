//
//  HGRegSetMainController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/13.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGRegSetMainController.h"
#import "HGRegSetView.h"

@interface HGRegSetMainController ()

@property(nonatomic,weak) HGRegSetView *RegSetView;
@end

@implementation HGRegSetMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:HGWhite];
    [self setUpRegSetBodyView];
}

#pragma mark - 初始化注册设置视图

- (void) setUpRegSetBodyView
{
    HGRegSetView *RegSetView = [[HGRegSetView alloc] init];
    self.RegSetView = RegSetView;
    [RegSetView.RegisterBtn addTarget:self action:@selector(RegisterUser) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:RegSetView];
    
    [RegSetView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(0);
        make.left.equalTo(self.view.left).offset(0);
        make.bottom.equalTo(self.view.bottom).offset(0);
        make.right.equalTo(self.view.right).offset(0);
    }];
}

#pragma mark - 注册提交

- (void) RegisterUser
{
//    NSString *teststr = @"leewihong";
//    NSString *desc = [RSA encryptString:teststr publicKey:self.PublickKey];
//
//    NSLog(@"------%@",desc);
//    NSString *enstr = [RSA decryptString:@"iI6pIGUi3iiG9k8e9KT15H5TRENYPNHOTxNJHEddS0ti1PRUuD17uqSPNn8/L3f6zromGwagDUhslTXCBsdd3VkPmmVp+iuG1H2PB80CAnDu6FisVH2C1CY92RdiIeHDfPxk7MO7mcjFTiWpe5eDSKcXkNuWtaatot9yRgq3QUM=" privateKey:@"MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAKqwd+nmLus+laVZL5U5kA2OypbdEhuCRtcWxi5cViripFdnV+qh20qJzUrkGF6Pm0xxH5/T4V6O+giBzf+OmzBKTDKZncAmzl22QIFtIy67HZJnOOFR7ATCHJyGL9PuAmlL1krj9fzXBLccOFwyVyr4RW5q1Ii9+0ZwABE97YgTAgMBAAECgYAUGprVEsZ98K4hfoKrOc9suV/FKx6h3NNJLCaFeVywymb+4G4rdYrlmZtzcbApGxL4iu5lncgSohZzAA7qRbqjYSkjHTOXcUAJ4KXwB9Vq28tIBO9VD0MOkj+UWlt7TsfpxH9WlcR+VdNB04JyeJsqupd8q88A56sziGxbbwII2QJBANd8isDfjKh6BeMLYjYOfOuPHQmalhFQCPiiL40++DkPd2U+PApWzfJ5993xrvP27Wcpk5Pxqn/KC3JitzdpVA0CQQDKx9HSfAyHqoBUbJWWnTYqOYd/7q+W94Y1D2pruuj2zqTxzNqUI4H+UxudhEO+iYULlGaNqzoWZBDIwOBD0qSfAkAiqzbnsQ/AS2GHFd3HNK2EeJIDaYubXXUUC4P7BZaKF6Lt9wVR5IVd7aGjY67yMVggsN+9fbQguzD8RkWT9K5BAkBBXeRvW3mWignQLSiTYp5BQkZBoSmNGsFyfUOq8peCZ96X65dSRZfz6cpvHmHQG/h9YRsl89pHuX4HmNUyR8a1AkA7lKMuRtRUjiKj7WbR/Y21kC5+whIXC0HJZOkjfKXZ+kpTj26zOa7oRYuk4WbySr0FKTep2gCpDEp9w2pjTgrv"];
//    NSLog(@"---11%@",enstr);
    
    HGHUD *hud = [[HGHUD alloc] initWithView:self.view];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:self.RegSetView.UserNameField.text forKey:@"username"];
    [dict setValue:self.telephone forKey:@"telephone"];
    [dict setValue:[RSA encryptString:self.RegSetView.PasswordField.text publicKey:self.PublickKey] forKey:@"password"];
    [dict setValue:[RSA encryptString:self.RegSetView.REPasswordField.text publicKey:self.PublickKey] forKey:@"repeatpassword"];
    [hud ShowWaitWithState:@"网络请求中..." Excute:^{
        [HGNetworkUtils ConnectWithMeThod:GET Url:REGISTER Parameters:dict Success:^(NSDictionary *data) {
            NSLog(@"----%@",data);
        } Failure:^(NSError *error) {
            NSLog(@"%@---",error);
        }];
    } Complete:^{
        [hud DissmissWaiting];
    }];
    
}




@end
