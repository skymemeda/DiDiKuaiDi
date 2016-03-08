//
//  ExpressOfUpDoorView.h
//  CaoCaoKuaiDi
//
//  Created by goofygao on 16/3/8.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpressOfUpDoorView : UIView

/**
 *  快递员头像
 */
@property (nonatomic,strong) UIImage *  couierImage;

/**
 *  快递类型
 */
@property (nonatomic,strong) UIImage *expressTypeImage;

/**
 *  用户名
 */
@property (nonatomic,copy) NSString *userName;
/**
 *  认证状态 0未认证 1 认证
 */
@property (nonatomic,copy) NSString *authenticateOrNo;
/**
 *  快递员星级评分
 */
@property (nonatomic,assign) CGFloat *couierLevel;
/**
 *  接单 次数
 */
@property (nonatomic,assign) NSInteger OrderTimes;
/**
 *  电话按钮
 */
@property (nonatomic,strong) UIButton *callCouierButton;
/**
 *  备注按钮
 */
@property (nonatomic,strong) UIButton *remarksButton;
/**
 *  催单按钮
 */
@property (nonatomic,strong) UIButton *reminderButton;

@end
