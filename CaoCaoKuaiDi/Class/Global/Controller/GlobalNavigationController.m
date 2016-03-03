//
//  GlobalNavigationController.m
//  CaoCaoKuaiDi
//
//  Created by goofygao on 16/2/27.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "GlobalNavigationController.h"
#import "UIBarButtonItem+GFBarButtonItem.h"

@interface GlobalNavigationController () <UINavigationControllerDelegate>

@property (nonatomic,strong) id popGestureRecognizerDelegate;

@end

@implementation GlobalNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma delegate
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate =_popGestureRecognizerDelegate;
    } else {
        _popGestureRecognizerDelegate = self.interactivePopGestureRecognizer.delegate;
        self.interactivePopGestureRecognizer.delegate = nil;
        
    }
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSLog(@"%s",__func__);
    if (self.viewControllers.count != 0) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"iconfont-dianjicichufanhui"] highImage:[UIImage imageNamed:@"iconfont-dianjicichufanhui"] target:self action:@selector(backToPre) forControlEvents:UIControlEventTouchDown];
    
    }
    [super pushViewController:viewController animated:animated];
    
    

}


#pragma action

-(void)backToPre {
    [self popViewControllerAnimated:YES];
}


@end
