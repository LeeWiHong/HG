//
//  HGTabBarController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/10.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGTabBarController.h"
#import "HGMainNavController.h"
#import "HGHomeMainController.h"
#import "HGCateMainController.h"
#import "HGPersonalMainController.h"
#import "HGTabBar.h"

@interface HGTabBarController()<UITabBarDelegate>

@end

@implementation HGTabBarController

+ (void)load{
    NSMutableDictionary *SelectDict = [NSMutableDictionary dictionary];
    SelectDict[NSFontAttributeName] = HGTabButtonTitleFont;
    SelectDict[NSForegroundColorAttributeName] = [UIColor colorWithHexString:HGTabSelectColor];
    [[UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[HGTabBarController class]]] setTitleTextAttributes:SelectDict forState:UIControlStateSelected];
    
    NSMutableDictionary *NormalDict = [NSMutableDictionary dictionary];
    NormalDict[NSFontAttributeName] = HGTabButtonTitleFont;
    NormalDict[NSForegroundColorAttributeName] = [UIColor colorWithHexString:HGTabNormalColor];
    [[UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[HGTabBarController class]]] setTitleTextAttributes:NormalDict forState:UIControlStateNormal];
}

- (void)viewDidLoad{
//    1.添加子控制器
    [self setUpAllChildController];
//    2.设置所有子控制器对应按钮的内容
    [self setUpAllTabButton];
//    3.创建tabbar
    HGTabBar *tabbar = [[HGTabBar alloc] init];
    tabbar.frame = CGRectMake(0, HGHeight - 83, HGWidth, 83);
    [self setValue:tabbar forKey:@"tabBar"];
}

#pragma mark - 添加所有的子控制器

- (void) setUpAllChildController
{
//    1. 添加首页控制器
    HGHomeMainController *HomeMainVC = [[HGHomeMainController alloc] init];
    [self addChildViewController:HomeMainVC];
    
//    2.添加分类控制器
    HGCateMainController *CateMainVC = [[HGCateMainController alloc] init];
    [self addChildViewController:CateMainVC];
    
//    3.添加个人中心控制器
    HGPersonalMainController *PersonalMainVC = [[HGPersonalMainController alloc] init];
    [self addChildViewController:PersonalMainVC];
}

#pragma mark - 设置所有自控制器对应按钮的内容

- (void) setUpAllTabButton
{
    [self setUpController:self.childViewControllers[0] Title:@"首页" Tag:0 NorImage:@"btn_sy" SelectImage:@"btn_sy2"];
    [self setUpController:self.childViewControllers[1] Title:@"分类" Tag:1 NorImage:@"btn_fl" SelectImage:@"btn_fl2"];
    [self setUpController:self.childViewControllers[2] Title:@"我的" Tag:2 NorImage:@"btn_wd" SelectImage:@"btn_wd2"];
}

#pragma mark - 重写把传入的控制器包装成导航控制器

- (void) addChildViewController:(UIViewController *)childController
{
    HGMainNavController *navVC = [[HGMainNavController alloc] initWithRootViewController:childController];
    [super addChildViewController:navVC];
}

#pragma mark - 设置tabbar上子控制器所对应按钮的内容

- (void) setUpController:(UIViewController *)VC Title:(NSString *)title Tag:(NSInteger)tag NorImage:(NSString *)NorImage SelectImage:(NSString *)SelImage
{
    VC.tabBarItem.title = title;
    VC.tabBarItem.tag = tag;
    VC.tabBarItem.image = [UIImage imageNamed:NorImage];
    VC.tabBarItem.selectedImage = [UIImage imageNamedWithOriganlMode:SelImage];
}





@end


