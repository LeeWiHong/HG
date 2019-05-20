//
//  HGAdviceFeedMainController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/20.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGAdviceFeedMainController.h"
#import "HGAdviceFeedView.h"

@interface HGAdviceFeedMainController ()

@property(nonatomic,weak) HGAdviceFeedView *AdviceFeed;
@end

@implementation HGAdviceFeedMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:HGWhite];
    [self setUpAdviceFeedBodyView];
}

#pragma mark - 初始化视图

- (void) setUpAdviceFeedBodyView
{
    HGAdviceFeedView *AdviceFeed = [[HGAdviceFeedView alloc] init];
    [AdviceFeed.SubmitBtn addTarget:self action:@selector(AdviceSubmitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.AdviceFeed = AdviceFeed;
    [self.view addSubview:AdviceFeed];
    
    [AdviceFeed makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(0);
        make.left.equalTo(self.view.left).offset(0);
        make.bottom.equalTo(self.view.bottom).offset(0);
        make.right.equalTo(self.view.right).offset(0);
    }];
}

#pragma mark - 提交意见

- (void) AdviceSubmitBtnClick
{
    HGHUD *hud = [[HGHUD alloc] initWithView:self.view];
    if (self.AdviceFeed.ContentView.text.length > 10) {
        if ([HGExpressTools isValidPhone:self.AdviceFeed.TelePhoneField.text]) {
            [hud ShowWaitWithState:@"正在提交..." Excute:^{
                NSMutableDictionary *dict = [NSMutableDictionary dictionary];
                [dict setValue:self.AdviceFeed.TitleField.text forKey:@"title"];
                [dict setValue:self.AdviceFeed.ContentView.text forKey:@"content"];
                [dict setValue:self.AdviceFeed.TelePhoneField.text forKey:@"telephone"];
                [self.Connection ConnectWithMeThod:POST Url:ADDADVICE Parameters:dict Success:^(NSDictionary *data) {
                    if ([[data valueForKey:@"success"] boolValue]) {
                        [hud ShowToastWithState:[data valueForKey:@"msg"] Complete:^{
                            [hud DissmissWaiting];
                        }];
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
                
            } Complete:^{
                [hud DissmissWaiting];
            }];
            hud = nil;
        }
        else{
            [hud ShowToastWithState:@"请输入正确的手机号码" Complete:^{
                [hud DissmissWaiting];
            }];
        } 
    }
    else
    {
        [hud ShowToastWithState:@"请输入合适的意见反馈内容" Complete:^{
            [hud DissmissWaiting];
        }];
    }
}

#pragma mark - 返回上级页面

- (void) Jump2BackVC
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}



@end
