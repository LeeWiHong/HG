//
//  HGMainNavController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/10.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGMainNavController.h"

@interface HGMainNavController ()

@end

@implementation HGMainNavController

+ (void)load{
    NSMutableDictionary *NavDict = [NSMutableDictionary dictionary];
    NavDict[NSFontAttributeName] = HGNavTitleFont;
    NavDict[NSForegroundColorAttributeName] = [UIColor colorWithHexString:HGWhite];
    [[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[HGMainNavController class]]] setTitleTextAttributes:NavDict];
    [[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[HGMainNavController class]]] setBackgroundImage:[UIImage imageNamed:@"111"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        UIBarButtonItem *backItem = [UIBarButtonItem backItemWithImage:[UIImage imageNamed:@"btn_back"] highImage:[UIImage imageNamed:@"btn_back"] target:self action:@selector(back) norColor:[UIColor colorWithHexString:HGWhite] highColor:[UIColor redColor] title:nil];
        viewController.navigationItem.leftBarButtonItem = backItem;
    }
    [super pushViewController:viewController animated:animated];
    
}

#pragma mark - 点击返回按钮返回到上一个界面

- (void) back
{
    [self popViewControllerAnimated:YES];
}



@end
