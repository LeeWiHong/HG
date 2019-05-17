//
//  AppDelegate.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/10.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "AppDelegate.h"
#import "HGTabBarController.h"
#import <Bugly/Bugly.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//  集成bugly
    [Bugly startWithAppId:@"5766c53224"];
    self.window = [[UIWindow alloc] initWithFrame:HGFrame];
    HGTabBarController *TabBarVC = [[HGTabBarController alloc] init];
    self.window.rootViewController = TabBarVC;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {

}


@end
