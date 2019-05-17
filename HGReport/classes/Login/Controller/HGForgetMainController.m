//
//  HGForgetMainController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/13.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGForgetMainController.h"
#import "HGForgetView.h"

@interface HGForgetMainController ()

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
    [self.view addSubview:ForgetView];
    
    [ForgetView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(0);
        make.left.equalTo(self.view.left).offset(0);
        make.bottom.equalTo(self.view.bottom).offset(0);
        make.right.equalTo(self.view.right).offset(0);
    }];
}

@end
