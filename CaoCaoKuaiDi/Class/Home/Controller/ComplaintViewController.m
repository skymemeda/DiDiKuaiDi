//
//  ComplaintViewController.m
//  CaoCaoKuaiDi
//
//  Created by goofygao on 16/3/11.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "ComplaintViewController.h"

@interface ComplaintViewController ()



@end

@implementation ComplaintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark initView 
- (void)initView {
    self.title = @"投诉";
    self.view.backgroundColor = [UIColor colorWithRed:249.0/255.0 green:241.0/255.0 blue:235.0/255.0 alpha:1];
    UIButton *callServicePhone = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
    callServicePhone.titleLabel.font =[UIFont systemFontOfSize:17];
    [callServicePhone setTitle:@"客服电话" forState:UIControlStateNormal];
    [callServicePhone setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [callServicePhone addTarget:self action:@selector(collectCouierAction) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:callServicePhone];
    
    UILabel *promptWordLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 64 + 10, SCRE_WIDTH - 10, 20)];
    promptWordLabel.text = @"寄快递的过程中遇到什么问题呢?";
    promptWordLabel.textColor = [UIColor grayColor];
    promptWordLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:promptWordLabel];

}

#pragma mark action事件响应

- (void)collectCouierAction {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://18814184180"]];
}

@end
