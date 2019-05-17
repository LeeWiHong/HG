//
//  HGRegSetMainController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/13.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGRegSetMainController.h"
#import "HGRegSetView.h"
#import "HGUserInfoModel.h"

@interface HGRegSetMainController ()

@property(nonatomic,weak) HGRegSetView *RegSetView;

@property(nonatomic,weak) HGUserInfoModel *UserInfoModel;
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
    
    HGHUD *hud = [[HGHUD alloc] initWithView:self.view];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:self.RegSetView.UserNameField.text forKey:@"username"];
    [dict setValue:self.telephone forKey:@"telephone"];
    [dict setValue:[RSA encryptString:self.RegSetView.PasswordField.text publicKey:self.PublickKey] forKey:@"password"];
    [dict setValue:[RSA encryptString:self.RegSetView.REPasswordField.text publicKey:self.PublickKey] forKey:@"repeatpassword"];
    [hud ShowWaitWithState:@"网络请求中..." Excute:^{
        [self.Connection ConnectWithMeThod:GET Url:REGISTER Parameters:dict Success:^(NSDictionary *data) {
            if ([[data valueForKey:@"success"] boolValue]) {
                self.UserInfoModel = [HGUserInfoModel mj_objectWithKeyValues:[data valueForKey:@"data"]];
                [hud DissmissWaiting];
                [self BackToRootVCWith:self.UserInfoModel];
            }
            else{
                [hud ShowToastWithState:[data valueForKey:@"msg"] Complete:^{
                    [hud DissmissWaiting];
                }];
            }
            NSLog(@"----%@",data);
        } Failure:^(NSError *error) {
            [hud ShowToastWithState:@"网络连接失败..." Complete:^{
                [hud DissmissWaiting];
            }];
            NSLog(@"%@---",error);
        }];
    } Complete:^{
        [hud DissmissWaiting];
    }];
}

#pragma mark - 返回根控制器页面

- (void) BackToRootVCWith:(HGUserInfoModel *)UserInfoModel
{
    self.RegSetReturn(UserInfoModel);
    [self.navigationController popToRootViewControllerAnimated:YES];
}



@end
