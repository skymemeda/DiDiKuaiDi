//
//  LeftHomeController.m
//  CaoCaoKuaiDi
//
//  Created by goofygao on 16/2/27.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "LeftHomeController.h"
#import "HomeViewController.h"
#import "GlobalNavigationController.h"
#import "MyWalletViewController.h"
#import "PersonalnfoViewController.h"
#import "RecommendViewController.h"
#import "SettingViewController.h"
#import "MessageViewController.h"
#import "MyOrdersViewController.h"
#import "OftenAdressViewController.h"

@interface LeftHomeController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *LeftTableView;

@property (nonatomic,strong) UIView *headView;

@property (nonatomic,strong) HomeViewController *PushDelegate;

@property (nonatomic,strong) NSArray *controllArr;

@property (nonatomic,strong) UIWindow *window;

@end

@implementation LeftHomeController

- (NSArray *)controllArr
{
    if (!_controllArr) {
        _controllArr  = @[
                          [[MyWalletViewController alloc]init],
                          [[MyOrdersViewController alloc]init],
                          [[MessageViewController alloc]init],
                          [[RecommendViewController alloc]init],
                          [[OftenAdressViewController alloc]init],
                          [[SettingViewController alloc]init],
                          ];
    }
    return _controllArr;
}

- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MOVE_X, 220)];
        
        
        
        UIView *imageView = [[UIView alloc] initWithFrame:CGRectMake(SCRE_WIDTH/8, 35, SCRE_WIDTH/2, SCRE_WIDTH/2)];
        [_headView addSubview:imageView];
        UITapGestureRecognizer *headTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTapClick)];
        [imageView addGestureRecognizer:headTap];
        
        
        UIImageView *aicon = [[UIImageView alloc] initWithFrame:CGRectMake(SCRE_WIDTH/4-SCRE_WIDTH/3/2, 0, SCRE_WIDTH/3, SCRE_WIDTH/3)];
        aicon.image = [UIImage imageNamed:@"touxiang"];
        aicon.layer.cornerRadius = SCRE_WIDTH/6;
        aicon.layer.masksToBounds = YES;
        [imageView addSubview:aicon];
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, SCRE_WIDTH/3+5, SCRE_WIDTH/2, 20)];
        nameLabel.text = @"Goofyy";
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [imageView addSubview:nameLabel];
        
        for (int i = 0; i<5; i++) {
            UIButton *btnStar = [[UIButton alloc] initWithFrame:CGRectMake(i*20+10, SCRE_WIDTH/3+30, 15, 15)];
            [btnStar setBackgroundImage:[UIImage imageNamed:@"5_msyc_evaluate"] forState:UIControlStateNormal];
            [imageView addSubview:btnStar];
        }
        
        UILabel *gradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.size.width-50, SCRE_WIDTH/3+30, 50, 20)];
        gradeLabel.text = @"5.0分";
        gradeLabel.textAlignment = NSTextAlignmentRight;
        [imageView addSubview:gradeLabel];
        
        
    }
    return _headView;
}

- (UITableView *)LeftTableView
{
    if (!_LeftTableView) {
        _LeftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MOVE_X, SCRE_HEIGHT)];
        _LeftTableView.dataSource = self;
        _LeftTableView.delegate = self;
        _LeftTableView.scrollEnabled = NO;
        _LeftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _LeftTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.LeftTableView];
    self.LeftTableView.tableHeaderView = self.headView;
    
}

#pragma mark 事件响应

-(void)headTapClick {
    PersonalnfoViewController *persinalInfo = [[PersonalnfoViewController alloc]init];
    self.window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, SCRE_WIDTH, SCRE_HEIGHT)];
    _window.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    GlobalNavigationController *gloNav = [[GlobalNavigationController alloc]initWithRootViewController:homeVC];
    
    
    _window.rootViewController = gloNav;
    [_window makeKeyAndVisible];
    
    //    [self presentViewController:vc animated:YES completion:nil];
    [homeVC.navigationController pushViewController:persinalInfo animated:YES];
}

#pragma mark -tableview 设置数据源和代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
// 设置数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *Leftcell = [tableView dequeueReusableCellWithIdentifier:@"Leftcell"];
    if (!Leftcell) {
        Leftcell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Leftcell"];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, Leftcell.frame.size.height-1, MOVE_X, 1)];
        line.backgroundColor = [UIColor orangeColor];
        [Leftcell.contentView addSubview:line];
        
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            Leftcell.textLabel.text = @"我的钱包";
            Leftcell.imageView.image = [UIImage imageNamed:@"4_cl_wallet"];
            
        }else if (indexPath.row == 1)
        {
            Leftcell.textLabel.text = @"我的订单";
            Leftcell.imageView.image = [UIImage imageNamed:@"4_cl_journey"];
            Leftcell.textLabel.textColor = [UIColor purpleColor];
        }else if (indexPath.row == 2)
        {
            Leftcell.textLabel.text = @"消息中心";
            Leftcell.imageView.image = [UIImage imageNamed:@"4_cl_integral"];
        }else if (indexPath.row == 3)
        {
            Leftcell.textLabel.text = @"推荐有奖";
            Leftcell.imageView.image = [UIImage imageNamed:@"4_cl_information"];
        }else if (indexPath.row == 4)
        {
            Leftcell.textLabel.text = @"常用地址";
            Leftcell.imageView.image = [UIImage imageNamed:@"4_cl_Birthday"];
        }else if (indexPath.row == 5) {
            Leftcell.textLabel.text = @"设置";
            Leftcell.imageView.image = [UIImage imageNamed:@"4_cl_activity"];
        }
        
    }
    return Leftcell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UIViewController *vc = self.controllArr[indexPath.row];
    
    self.window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, SCRE_WIDTH, SCRE_HEIGHT)];
    _window.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    GlobalNavigationController *gloNav = [[GlobalNavigationController alloc]initWithRootViewController:homeVC];
    
    
    _window.rootViewController = gloNav;
    [_window makeKeyAndVisible];
    
    //    [self presentViewController:vc animated:YES completion:nil];
    [homeVC.navigationController pushViewController:vc animated:YES];
    //    [self pushViewController:vc animated:YES];
}

#pragma mark

@end

