//
//  HGBaseMainController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/10.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGBaseMainController.h"

@interface HGBaseMainController ()


@end

@implementation HGBaseMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:HGWhiteGray];
    [self setUpNetConnectUtils];
    [self setUpHudView];
}

#pragma mark - 初始化网络连接对象

- (void) setUpNetConnectUtils
{
    self.Connection = [[HGNetworkUtils alloc] init];
}

#pragma mark - 初始化HUD对象

- (void) setUpHudView
{
    self.HUD = [[HGHUD alloc] initWithView:self.view];
}



@end
