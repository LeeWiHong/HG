//
//  HGHomeMainController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/10.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGHomeMainController.h"
#import "HGHomeNavView.h"
#import "HGHomeTabView.h"
#import "HGHomeHeadView.h"

@interface HGHomeMainController ()<UIScrollViewDelegate>

@property(nonatomic,weak) HGHomeTabView *HomeTabView;

@property(nonatomic,weak) HGHomeHeadView *HeadView;
@end

@implementation HGHomeMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithHexString:HGWhite];
    [self setUpHomeBodyView];
    
}

#pragma mark - 初始化视图

- (void) setUpHomeBodyView
{
    HGHomeHeadView *HeadView = [[HGHomeHeadView alloc] initWithFrame:CGRectMake(0, 0, HGWidth, 200)];
    self.HeadView = HeadView;
    
    HGHomeTabView *HomeTabView = [[HGHomeTabView alloc] initWithFrame:CGRectMake(0, 0, HGWidth, HGHeight) style:UITableViewStylePlain];
    HomeTabView.delegate = self;
    HomeTabView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    HomeTabView.tableHeaderView = HeadView;
    self.HomeTabView = HomeTabView;
    [self.view addSubview:HomeTabView];
    
    HGHomeNavView *HomeNavView = [[HGHomeNavView alloc] initWithFrame:CGRectMake(0, 0, HGWidth, 64)];
    [self.view addSubview:HomeNavView];
}

#pragma mark - 处理滑动

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"xxx%f",self.HeadView.bounds.origin.x);
    NSLog(@"yyy%f",self.HeadView.bounds.origin.y);
    NSLog(@"hhh%f",self.HeadView.bounds.size.height);
    NSLog(@"---xxx%f",self.HomeTabView.bounds.origin.x);
    NSLog(@"---yyy%f",self.HomeTabView.bounds.origin.y);
    NSLog(@"---hhh%f",self.HomeTabView.bounds.size.height);
    NSLog(@"%f",scrollView.contentOffset.y);
}








@end
