//
//  HGCateMainController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/10.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGCateMainController.h"
#import "HGCateCollectionView.h"
#import "HGCateCollectionCell.h"
#import "HGCateModel.h"

@interface HGCateMainController ()

@property(nonatomic,strong) NSMutableArray *CateArray;

@property(nonatomic,weak) HGCateCollectionView *CateView;

@property(nonatomic,assign) int pageno;

@property(nonatomic,assign) int pages;
@end

@implementation HGCateMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"分类";
    self.pageno = 1;
    self.view.backgroundColor = [UIColor colorWithHexString:HGWhite];
    [self ConnectWithAllCategoryWithNewView:YES RemoveData:NO WithPageNo:self.pageno];
    
}

#pragma mark - 刷新数据

- (void) loadFreshHeaderData
{
    self.pageno = 1;
    [self ConnectWithAllCategoryWithNewView:NO RemoveData:YES WithPageNo:self.pageno];
}

#pragma mark - 加载更多数据

- (void) loadMoreFooterData
{
    self.pageno = self.pageno + 1;
    if (_pageno <= _pages) {
        [self ConnectWithAllCategoryWithNewView:NO RemoveData:NO WithPageNo:self.pageno];
    }
    else{
        [self.CateView.mj_footer setState:MJRefreshStateNoMoreData];
    }
}


#pragma mark - 网络请求所有分类

- (void) ConnectWithAllCategoryWithNewView:(BOOL) NewView RemoveData:(BOOL)RemoveData WithPageNo:(NSInteger) pageno
{
    HGHUD *hud = [[HGHUD alloc] initWithView:self.view];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:[NSString stringWithFormat:@"%ld",pageno] forKey:@"pageno"];
    [dict setValue:@"9" forKey:@"pagesize"];
    [hud ShowWaitWithState:@"获取数据..." Excute:^{
        [self.Connection ConnectWithMeThod:GET Url:ALLCATEGORY Parameters:dict Success:^(NSDictionary *data) {
            if ([[data valueForKey:@"success"] boolValue]) {
                self.pages = [[[data valueForKey:@"data"] valueForKey:@"pages"] intValue];
                if (NewView) {
                    self.CateArray = [HGCateModel mj_objectArrayWithKeyValuesArray:[[data valueForKey:@"data"] valueForKey:@"list"]];
                    self.pages = [[data valueForKey:@"data"] valueForKey:@"pages"];
                    [self setUpCategoryBodyViewWithArray:self.CateArray];
                }
                else{
                    if (RemoveData) {
                        [self.CateArray removeAllObjects];
                        self.CateArray = [HGCateModel mj_objectArrayWithKeyValuesArray:[[data valueForKey:@"data"] valueForKey:@"list"]];
                        self.CateView.CateArray = self.CateArray;
                       
                    } else {
                        self.CateArray = [[self.CateArray arrayByAddingObjectsFromArray:[HGCateModel mj_objectArrayWithKeyValuesArray:[[data valueForKey:@"data"] valueForKey:@"list"]]] mutableCopy];
                        self.CateView.CateArray = self.CateArray;
                        [self.CateView reloadData];
                    }
                     [self.CateView reloadData];
                    
                }
            }
            else
            {
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
        [self.CateView.mj_header endRefreshing];
        [self.CateView.mj_footer endRefreshing];
        self.CateView.mj_header.state = MJRefreshStateIdle;
        self.CateView.mj_footer.state = MJRefreshStateIdle;
        [hud DissmissWaiting];
    }];
    
}


#pragma mark - 初始化分类视图

- (void) setUpCategoryBodyViewWithArray:(NSMutableArray *)CateArray
{
    if (self.CateView) {
        self.CateView.CateArray = CateArray;
        [self.CateView reloadData];
    }
    else{
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        //设置CollectionView的属性
        HGCateCollectionView *CateView = [[HGCateCollectionView alloc] initWithFrame:CGRectMake(0, 0, HGWidth, HGHeight - NaviBarStateHeight - TabBarHeight) collectionViewLayout:flowLayout];
        CateView.mj_header = [HGFreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadFreshHeaderData)];
        CateView.mj_footer = [HGFreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreFooterData)];
        CateView.CateArray = CateArray;
        CateView.alwaysBounceVertical = YES;
        CateView.backgroundColor = [UIColor colorWithHexString:HGWhiteGray];
        self.CateView = CateView;
        [self.view addSubview:CateView];
    }
}


@end
