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
#import "UIView+Extend.h"

@interface LeftHomeController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *LeftTableView;

@property (nonatomic,strong) UIView *headView;

@property (nonatomic,strong) HomeViewController *PushDelegate;

@property (nonatomic,strong) NSArray *controllArr;

@property (nonatomic,strong) UIWindow *window;

@property (nonatomic,strong) UIImageView *userImageView;

@property (nonatomic,strong) UILabel *userNameLabel;

@property (nonatomic,strong) UILabel *userPhoneNumberLabel;

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
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MOVE_X, 140)];
        
        
        
        UIView *imageView = [[UIView alloc] initWithFrame:CGRectMake(0, 35, SCRE_WIDTH * 4/5, 100)];
        [_headView addSubview:imageView];
        UITapGestureRecognizer *headTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTapClick)];
        [imageView addGestureRecognizer:headTap];

        self.userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 80, 80)];
        _userImageView.image = [UIImage imageNamed:@"touxiang"];
        _userImageView.layer.cornerRadius = _userImageView.width/2;
        _userImageView.layer.borderWidth = 5;
        _userImageView.layer.borderColor = [[UIColor whiteColor] CGColor];
        _userImageView.layer.masksToBounds = YES;
        [imageView addSubview:_userImageView];
        
        self.userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_userImageView.frame) + 10, CGRectGetMinY(_userImageView.frame) + 15, SCRE_WIDTH/2, 20)];
        _userNameLabel.text = @"Goofyy";
        _userNameLabel.font = [UIFont systemFontOfSize:13];
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
        [imageView addSubview:_userNameLabel];
        
        
        self.userPhoneNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_userNameLabel.frame), CGRectGetMaxY(_userNameLabel.frame) + 5, 100, 20)];
        _userPhoneNumberLabel.text = @"188****4180";
        _userPhoneNumberLabel.font = [UIFont systemFontOfSize:13];
        _userPhoneNumberLabel.textAlignment = NSTextAlignmentLeft;
        [imageView addSubview:_userPhoneNumberLabel];
        
        UIImageView *imageViewMak = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(imageView.frame) - 40, 20, 10, 20)];
        imageViewMak.image = [UIImage imageNamed:@"header_view_right"];
        [imageView addSubview:imageViewMak];
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

