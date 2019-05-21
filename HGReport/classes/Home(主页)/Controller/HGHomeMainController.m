//
//  HGHomeMainController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/10.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGHomeMainController.h"
#import "HGHomeNavView.h"
#import "HGHomeHeadView.h"
#import "HGHomeTabCell.h"

@interface HGHomeMainController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak) UITableView *HomeTabView;

@property(nonatomic,weak) HGHomeNavView *HomeNavView;

@end

NSString *HomeCell = @"HGHomeTabCell";

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
    UITableView *HomeTabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, HGWidth, HGHeight - 64) style:UITableViewStylePlain];
    HomeTabView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    HomeTabView.delegate = self;
    HomeTabView.dataSource = self;
    [HomeTabView registerClass:[HGHomeTabCell class] forCellReuseIdentifier:HomeCell];
    self.HomeTabView = HomeTabView;
    [self.view addSubview:HomeTabView];
    
    HGHomeNavView *HomeNavView = [[HGHomeNavView alloc] initWithFrame:CGRectMake(0, 0, HGWidth, 64)];
    self.HomeNavView = HomeNavView;
    [self.view addSubview:HomeNavView];
}

- (NSInteger)numberOfSections{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160 * HGAutoHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HGHomeTabCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeCell];
    if (cell == nil) {
        cell = [[HGHomeTabCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HomeCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - 处理滑动

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scrolloffset = scrollView.contentOffset.y;
    if (scrolloffset >= 0 && scrolloffset <= 64) {
        self.HomeNavView.layer.opacity = 1 - scrolloffset / 64;
        NSLog(@"aaa%f",1 - scrolloffset / 64);
    }
}


@end
