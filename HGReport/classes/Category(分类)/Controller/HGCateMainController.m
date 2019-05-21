//
//  HGCateMainController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/10.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGCateMainController.h"
#import "HGCateCollectionView.h"

@interface HGCateMainController ()

@end

@implementation HGCateMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"分类";
    self.view.backgroundColor = [UIColor colorWithHexString:HGWhite];
    [self setUpCategoryBodyView];
    
}

#pragma mark - 初始化分类视图

- (void) setUpCategoryBodyView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //设置CollectionView的属性
    HGCateCollectionView *CateView = [[HGCateCollectionView alloc] initWithFrame:CGRectMake(0, 0, HGWidth, HGHeight) collectionViewLayout:flowLayout];
    CateView.backgroundColor = [UIColor colorWithHexString:HGWhite];
    [self.view addSubview:CateView];
}



@end
