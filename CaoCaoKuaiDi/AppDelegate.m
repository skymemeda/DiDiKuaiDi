//
//  AppDelegate.m
//  CaoCaoKuaiDi
//
//  Created by goofygao on 16/2/27.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "AppDelegate.h"
#import "GlobalNavigationController.h"
#import "HomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    HomeViewController *Home = [[HomeViewController alloc] init];
    
    GlobalNavigationController *globalNav = [[GlobalNavigationController alloc]initWithRootViewController:Home];
    
    self.window.rootViewController = globalNav;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
