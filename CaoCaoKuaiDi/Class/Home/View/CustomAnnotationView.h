//
//  CustomAnnotationView.h
//  CaoCaoKuaiDi
//
//  Created by goofygao on 16/2/28.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "CustomMapCalloutView.h"

@interface CustomAnnotationView : MAAnnotationView

@property (nonatomic, readonly) CustomMapCalloutView *calloutView;

@end
