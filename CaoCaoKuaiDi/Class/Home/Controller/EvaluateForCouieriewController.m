//
//  EvaluateForCouieriewController.m
//  CaoCaoKuaiDi
//
//  Created by goofygao on 16/3/10.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "EvaluateForCouieriewController.h"
#import "ExpressOfUpDoorView.h"
#import "CouiserDetailViewController.h"

@interface EvaluateForCouieriewController ()

@property (nonatomic,strong) ExpressOfUpDoorView *expressOfUpDoorView;

@end

@implementation EvaluateForCouieriewController

- (ExpressOfUpDoorView*)expressOfUpDoorView {
    if (!_expressOfUpDoorView) {
        _expressOfUpDoorView = [[[NSBundle mainBundle]loadNibNamed:@"ExpressOfUpDoorView" owner:self options:nil]objectAtIndex:0];
        _expressOfUpDoorView.frame = CGRectMake(5, 68, SCRE_WIDTH - 10, 65);
        _expressOfUpDoorView.layer.cornerRadius = 5;
        _expressOfUpDoorView.layer.masksToBounds = YES;
        [_expressOfUpDoorView.callCouierBtn addTarget:self action:@selector(callCouierAction) forControlEvents:UIControlEventTouchDown];
        [_expressOfUpDoorView.couierHistoryOrders addTarget:self action:@selector(couierHistoryOrdersAction) forControlEvents:UIControlEventTouchDown];
    }
    return _expressOfUpDoorView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView {
    self.title = @"评价";
    self.view.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1];
    [self.view addSubview:self.expressOfUpDoorView];
    
}


#pragma mark action 事件响应
- (void)callCouierAction {
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"是否要打电话给\n18814184180" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
    [alertView show];
}

- (void)couierHistoryOrdersAction {
    [self.navigationController pushViewController:[CouiserDetailViewController new] animated:YES];
}

@end
