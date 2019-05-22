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


@end

NSString *HomeCell = @"HGHomeTabCell";

@implementation HGHomeMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithHexString:HGWhite];
    [self ConnectGetIndexData];
}

#pragma mark - 网络请求首页数据

- (void) ConnectGetIndexData
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:[NSString stringWithFormat:@"%d",1] forKey:@"pageno"];
    [dict setValue:[NSString stringWithFormat:@"%d",10] forKey:@"pagesize"];
    [self.Connection ConnectWithMeThod:GET Url:INDEXARTICLE Parameters:dict Success:^(NSDictionary *data) {
        if ([[data valueForKey:@"success"] boolValue]) {
            self.IndexArray = [HGIndexModel mj_objectArrayWithKeyValuesArray:[[data valueForKey:@"data"] valueForKey:@"list"]];
            [self setUpHomeBodyViewWithArray:self.IndexArray];
        } else {
            
        }
    } Failure:^(NSError *error) {
        
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
