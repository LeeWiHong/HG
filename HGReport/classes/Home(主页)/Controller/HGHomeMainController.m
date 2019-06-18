//
//  HGHomeMainController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/10.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGHomeMainController.h"
#import "HGHomeNavView.h"
#import "HGHomeTabCell.h"
#import "HGIndexModel.h"

@interface HGHomeMainController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak) UITableView *HomeTabView;

@property(nonatomic,weak) HGHomeNavView *HomeNavView;

@property(nonatomic,strong) NSMutableArray *IndexArray;

@property(nonatomic,assign) NSInteger pageno;

@property(nonatomic,assign) NSInteger pages;


@end

NSString *HomeCell = @"HGHomeTabCell";

@implementation HGHomeMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithHexString:HGWhite];
    _pageno = 1;
    [self ConnectGetIndexDataWithNewView:YES RemoveData:NO];
}

#pragma mark - 刷新数据

- (void) FreshHeadData
{
    self.pageno = 1;
    [self ConnectGetIndexDataWithNewView:NO RemoveData:YES];
}

#pragma mark - 加载更多数据

- (void) LoadMoreData
{
    _pageno = _pageno + 1;
    if (_pageno <= _pages ) {
        [self ConnectGetIndexDataWithNewView:NO RemoveData:NO];
    }
    else{
        self.HomeTabView.mj_footer.state =  MJRefreshStateNoMoreData;
    }
}

#pragma mark - 网络请求首页数据

- (void) ConnectGetIndexDataWithNewView:(BOOL)NewView RemoveData:(BOOL)RemoveData
{
    HGHUD *hud = [[HGHUD alloc] initWithView:self.view];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:[NSString stringWithFormat:@"%ld",_pageno] forKey:@"pageno"];
    [dict setValue:[NSString stringWithFormat:@"%d",10] forKey:@"pagesize"];
    [hud ShowWaitWithState:@"获取数据..." Excute:^{
        [self.Connection ConnectWithMeThod:GET Url:INDEXARTICLE Parameters:dict Success:^(NSDictionary *data) {
            if ([[data valueForKey:@"success"] boolValue]) {
                self.pages = [[[data valueForKey:@"data"] valueForKey:@"pages"] integerValue];
                if (NewView) {
                    self.IndexArray = [HGIndexModel mj_objectArrayWithKeyValuesArray:[[data valueForKey:@"data"] valueForKey:@"list"]];
                    [self setUpHomeBodyViewWithArray:self.IndexArray];
                }
                else{
                    if (RemoveData) {
                        [self.IndexArray removeAllObjects];
                        self.IndexArray  = [HGIndexModel mj_objectArrayWithKeyValuesArray:[[data valueForKey:@"data"] valueForKey:@"list"]];
                        [self.HomeTabView reloadData];
                    }
                    else{
                        self.IndexArray = [[self.IndexArray arrayByAddingObjectsFromArray:[HGIndexModel mj_objectArrayWithKeyValuesArray:[[data valueForKey:@"data"] valueForKey:@"list"]]] mutableCopy];
                        [self.HomeTabView reloadData];
                    }
                }
            } else {
                [hud ShowToastWithState:[data valueForKey:@"msg"] Complete:^{
                    [hud DissmissWaiting];
                }];
            }
        } Failure:^(NSError *error) {
            [hud ShowToastWithState:@"网络请求失败..." Complete:^{
                [hud DissmissWaiting];
            }];
        }];
    } Complete:^{
        [self.HomeTabView.mj_header endRefreshing];
        [self.HomeTabView.mj_footer endRefreshing];
        self.HomeTabView.mj_header.state = MJRefreshStateIdle;
        self.HomeTabView.mj_footer.state = MJRefreshStateIdle;
        [hud DissmissWaiting];
    }];
    
}

#pragma mark - 初始化视图

- (void) setUpHomeBodyViewWithArray:(NSMutableArray *)IndexArray
{
    UITableView *HomeTabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, HGWidth, HGHeight) style:UITableViewStylePlain];
    HomeTabView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    HomeTabView.delegate = self;
    HomeTabView.dataSource = self;
    [HomeTabView registerClass:[HGHomeTabCell class] forCellReuseIdentifier:HomeCell];
    self.HomeTabView = HomeTabView;
    [self.view addSubview:HomeTabView];
    
    HomeTabView.mj_header = [HGFreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(FreshHeadData)];
    HomeTabView.mj_footer = [HGFreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(LoadMoreData)];
    
    HGHomeNavView *HomeNavView = [[HGHomeNavView alloc] initWithFrame:CGRectMake(0, 0, HGWidth, 64)];
    self.HomeNavView = HomeNavView;
    [self.view addSubview:HomeNavView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.IndexArray.count;
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
    HGIndexModel *IndexModel = self.IndexArray[indexPath.row];
    cell.IndexModel = IndexModel;
    return cell;
}

#pragma mark - 处理滑动

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scrolloffset = scrollView.contentOffset.y;
    NSLog(@"eee%f",scrolloffset);
    if (scrolloffset >= -84 && scrolloffset <= 0) {
        self.HomeNavView.alpha = - scrolloffset / 84;
    }
    else if (scrolloffset < -84)
    {
        self.HomeNavView.alpha = 1;
    }
    else if (scrolloffset >0){
        self.HomeNavView.alpha = 0;
    }
    NSLog(@"bbb%f",self.HomeNavView.alpha);
}



@end
