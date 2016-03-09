//
//  ExpressOfUpDoorView.h
//  CaoCaoKuaiDi
//
//  Created by goofygao on 16/3/8.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpressOfUpDoorView : UIView

@property (nonatomic,strong) UIImage *couierImage;

@property (nonatomic,strong) NSString *expressTypeString;

@property (nonatomic,strong) NSString *couierName;

@property (nonatomic,copy) NSString *AuthenticationOrNo;

@property (nonatomic,assign) CGFloat couiserStarNumber;

@property (nonatomic,copy)NSString *couierVolumeOfOrders;


@property (weak, nonatomic) IBOutlet UIButton *callCouierBtn;

@end
