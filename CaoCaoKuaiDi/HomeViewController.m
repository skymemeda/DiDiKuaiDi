//
//  HomeViewController.m
//  66RentCar
//
//  Created by dyage on 15/12/22.
//  Copyright (c) 2015年 sole. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "YCXMenu.h"
#import "LeftHomeController.h"
#import "ScanBarCodeViewController.h"
#import "RecentOrdersViewController.h"
#import "CourierCollectionViewController.h"


@interface HomeViewController () <UINavigationBarDelegate,UIActionSheetDelegate>

@property (nonatomic,strong) NSMutableArray *items;

@property (nonatomic,strong) UIWindow *leftWindow;

@property (nonatomic,strong) UIView *leftView;

@end

@implementation HomeViewController

#pragma mark getter/setter

-(NSMutableArray *)items {
    if(!_items) {
        _items = [NSMutableArray array];
        _items = [@[
                    [YCXMenuItem menuItem:@"扫一扫"
                                    image:nil
                                      tag:100
                                 userInfo:@{@"title":@"Menu"}],
                    [YCXMenuItem menuItem:@"最近订单"
                                    image:nil
                                      tag:101
                                 userInfo:@{@"title":@"Menu"}],
                    [YCXMenuItem menuItem:@"收藏快递员"
                                    image:nil
                                      tag:102
                                 userInfo:@{@"title":@"Menu"}]
                    
                    ] mutableCopy];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self initNavigationBar];
    
}

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController == self) {
        self.navigationController.navigationBar.alpha = 0.300;
    }else{
        self.navigationController.navigationBar.alpha =1;
    }
}

-(void)initNavigationBar {
    self.title = @"曹操快递";
    UIButton *personalCenter = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    [personalCenter setTitle:@"个人中心" forState:UIControlStateNormal];
    [personalCenter addTarget:self action:@selector(pushPerCenter) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:personalCenter];
    
    UIButton *rightItemButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [rightItemButton setTitle:@"测试" forState:UIControlStateNormal];
    rightItemButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [rightItemButton addTarget:self action:@selector(rightBarButtonItemAction) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightItemButton];
}

#pragma mark --action
//左按钮navigationitem点击
-(void)rightBarButtonItemAction {
    [YCXMenu setTintColor:[UIColor colorWithRed:0.118 green:0.573 blue:0.820 alpha:1]];
    if ([YCXMenu isShow]){
        [YCXMenu dismissMenu];
    } else {
        [YCXMenu showMenuInView:self.view fromRect:CGRectMake(self.view.frame.size.width - 50, 64, 50, 0) menuItems:self.items selected:^(NSInteger index, YCXMenuItem *item) {
            if (item.tag == 100) {
                
                [self.navigationController pushViewController:[[ScanBarCodeViewController alloc]init] animated:YES];
            } else if(item.tag == 101) {
                [self.navigationController pushViewController:[[RecentOrdersViewController alloc]init] animated:YES];
            } else if (item.tag == 102) {
                [self.navigationController pushViewController:[[CourierCollectionViewController alloc]init] animated:YES];
            }
        }];
    }
}


-(void)pushPerCenter {
    self.leftWindow = [[UIWindow alloc]initWithFrame:CGRectMake(-SCRE_WIDTH, 0, SCRE_WIDTH * 4/5, SCRE_HEIGHT)];
    
    _leftWindow.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    LeftHomeController *leftVC = [[LeftHomeController alloc]init];
    _leftWindow.rootViewController = leftVC;
    
    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _leftWindow.frame = CGRectMake(0, 0, SCRE_WIDTH, SCRE_HEIGHT);
    } completion:nil];
    
    
    [_leftWindow makeKeyAndVisible];
    
}

@end
