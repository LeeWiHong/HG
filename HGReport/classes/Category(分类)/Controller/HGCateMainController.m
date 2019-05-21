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

@interface HGCateMainController ()

@end

@implementation HGCateMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"分类";
    self.view.backgroundColor = [UIColor colorWithHexString:HGWhite];
    [self setUpCategoryBodyView];
    
}

#pragma mark - 网络请求所有分类

- (void) ConnectWithAllCategory
{
    HGHUD *hud = [[HGHUD alloc] initWithView:self.view];
    [hud ShowWaitWithState:@"获取数据..." Excute:^{
        [self.Connection ConnectWithMeThod:GET Url:ALLCATEGORY Parameters:nil Success:^(NSDictionary *data) {
            if ([[data valueForKey:@"success"] boolValue]) {
                
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
        
    }];
    
}

#pragma mark - 初始化分类视图

- (void) setUpCategoryBodyView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //设置CollectionView的属性
    HGCateCollectionView *CateView = [[HGCateCollectionView alloc] initWithFrame:CGRectMake(0, 0, HGWidth, HGHeight - NaviBarStateHeight - TabBarHeight) collectionViewLayout:flowLayout];
    CateView.alwaysBounceVertical = YES;
    CateView.backgroundColor = [UIColor colorWithHexString:HGWhiteGray];
    [self.view addSubview:CateView];
}



@end
