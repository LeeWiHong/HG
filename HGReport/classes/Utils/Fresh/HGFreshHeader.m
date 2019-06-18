//
//  HGFreshHeader.m
//  HGReport
//
//  Created by LeeWiHong on 2019/6/18.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGFreshHeader.h"

@implementation HGFreshHeader

- (void)prepare
{
    [super prepare];
    self.automaticallyChangeAlpha = YES;
    [self setTitle:@"下拉放手刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"刷新中..." forState:MJRefreshStateRefreshing];
    self.stateLabel.textColor = [UIColor colorWithHexString:@"#888888"];
    self.lastUpdatedTimeLabel.hidden = YES;
}


@end
