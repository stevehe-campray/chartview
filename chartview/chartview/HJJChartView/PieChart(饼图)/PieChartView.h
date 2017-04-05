//
//  PieChartView.h
//  chartview
//
//  Created by hejingjin on 17/3/31.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieChartView : UIView

//饼图的数据数组 不可为2维数组
@property(nonatomic,strong)NSArray *dataarray;

//饼状图个部分的颜色
@property(nonatomic,strong)NSArray *colors;

//数据占的百分比数组
@property(nonatomic,strong,readonly)NSMutableArray *dataProportion;

//饼状图的宽度
@property(nonatomic,assign)CGFloat pieWitdth;

//开始画图
-(void)startDrawing;

@end
