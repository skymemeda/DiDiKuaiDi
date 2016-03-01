//
//  SearchExpressViewController.m
//  CaoCaoKuaiDi
//
//  Created by goofygao on 16/3/1.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "SearchExpressViewController.h"
#import "LBXScanView.h"
#import "LBXScanResult.h"
#import "LBXScanWrapper.h"
#import "ScanBarCodeViewController.h"
#import "UIScanTextField.h"

@interface SearchExpressViewController ()

@property (nonatomic,strong)UIScanTextField *expressNumberTextField;

@end

@implementation SearchExpressViewController


#pragma mark lazy load
-(UIScanTextField *)expressNumberTextField {
    if (!_expressNumberTextField) {
        _expressNumberTextField = [[UIScanTextField alloc]initWithFrame:CGRectMake(50, 100, SCRE_WIDTH - 100, 40)];
        [_expressNumberTextField.cameraScanButton addTarget:self action:@selector(cameraScanAction) forControlEvents:UIControlEventTouchDown];
        _expressNumberTextField.backgroundColor = [UIColor yellowColor];
    }
    return _expressNumberTextField;
}

#pragma mark 系统加载项
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark init初始化
- (void)initView {
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"查快递";
    [self.view addSubview:self.expressNumberTextField];
    if (_strScan) {
        _expressNumberTextField.text = _strScan;
    }
}


#pragma mark - custom function
- (void)notSquare
{
    //设置扫码区域参数
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    style.centerUpOffset = 44;
    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Inner;
    style.photoframeLineW = 4;
    style.photoframeAngleW = 28;
    style.photoframeAngleH = 16;
    style.isNeedShowRetangle = NO;
    
    style.anmiationStyle = LBXScanViewAnimationStyle_LineStill;
    
    
    style.animationImage = [self createImageWithColor:[UIColor redColor]];
    //非正方形
    //设置矩形宽高比
    style.whRatio = 4.3/2.18;
    
    //离左边和右边距离
    style.xScanRetangleOffset = 30;
    
    
    
    [self openScanVCWithStyle:style];
}


- (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


- (void)openScanVCWithStyle:(LBXScanViewStyle*)style
{
    ScanBarCodeViewController *vc = [ScanBarCodeViewController new];
    vc.style = style;
    //vc.isOpenInterestRect = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark 事件响应 action

-(void)cameraScanAction {
    [self notSquare];
    
}
@end
