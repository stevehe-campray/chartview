//
//  HJJPieLayer.h
//  chartview
//
//  Created by hejingjin on 17/3/31.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface HJJPieLayer : CAShapeLayer

//圆弧的宽度
@property(nonatomic,assign)CGFloat layerwidth;
//圆弧开始位置
@property(nonatomic,assign)CGFloat startlocation;
//圆弧结束位置
@property(nonatomic,assign)CGFloat endlocation;

//圆弧的颜色
@property(nonatomic,strong)UIColor *layerunitcolor;

//圆弧外层半径
@property(nonatomic,assign)CGFloat circleradius;

//圆心
@property(nonatomic,assign)CGPoint centrtpoint;


- (void)startpielayer;

@end
