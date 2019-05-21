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
}

#pragma mark - 初始化网络连接对象

- (void) setUpNetConnectUtils
{
    self.Connection = [[HGNetworkUtils alloc] init];
}



@end
