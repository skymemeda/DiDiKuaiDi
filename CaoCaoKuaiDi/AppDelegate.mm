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
#import <BaiduMapAPI_Base/BMKMapManager.h>


@interface AppDelegate ()

@property (nonatomic,strong) BMKMapManager *mapManager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.mapManager = [[BMKMapManager alloc]init];
    
    BOOL ret = [_mapManager start:@"b1sPXS3Gl6UVKnwAyRxZLh5Q"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    HomeViewController *Home = [[HomeViewController alloc] init];
    
    GlobalNavigationController *globalNav = [[GlobalNavigationController alloc]initWithRootViewController:Home];
    
    self.window.rootViewController = globalNav;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
