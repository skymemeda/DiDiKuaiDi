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
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchKit.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    
    [MAMapServices sharedServices].apiKey = @"d9408b814a25ea04565dc15434813c2a";
    
    [AMapSearchServices sharedServices].apiKey = @"d9408b814a25ea04565dc15434813c2a";
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    HomeViewController *Home = [[HomeViewController alloc] init];
    
    GlobalNavigationController *globalNav = [[GlobalNavigationController alloc]initWithRootViewController:Home];
    
    self.window.rootViewController = globalNav;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
