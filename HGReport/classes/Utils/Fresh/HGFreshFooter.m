//
//  HGFreshFooter.m
//  HGReport
//
//  Created by LeeWiHong on 2019/6/18.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGFreshFooter.h"

@implementation HGFreshFooter

- (void)prepare
{
    [super prepare];
    self.automaticallyChangeAlpha = YES;
    self.automaticallyRefresh = NO;
    [self setTitle:@"上拉放手加载更多" forState:MJRefreshStateIdle];
    [self setTitle:@"加载更多中..." forState:MJRefreshStateRefreshing];
    [self setTitle:@"没有更多数据了..." forState:MJRefreshStateNoMoreData];
    self.stateLabel.textColor = [UIColor colorWithHexString:@"#888888"];
}


@end
