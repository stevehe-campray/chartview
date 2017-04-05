//
//  BrokenlineView.h
//  chartview
//
//  Created by hejingjin on 17/3/31.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJJConst.h"


@interface BrokenlineView : UIView

//折线图数据array
@property(nonatomic,strong)NSArray *yvalueArray;

//颜色数组
@property(nonatomic,strong)NSArray *colors;


//X轴数组
@property(nonatomic,strong)NSArray *xnameArray;

//Y轴显示范围
@property (nonatomic, assign) CGRange chooseRange;

//每个数据占的宽度
@property (nonatomic, assign)CGFloat xwidth;
//折线宽度
@property (nonatomic, assign)CGFloat borderwidth;

//是否隐藏点
@property (nonatomic, assign)Boolean ishiddenPoint;
//是否隐藏显示数值
@property (nonatomic, assign)Boolean ishiddenLabel;

-(void)startDarwing;

@end
