//
//  HJJChartView.h
//  chartview
//
//  Created by hejingjin on 17/4/5.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJJConst.h"
@class HJJChartView;
typedef NS_ENUM(NSInteger, HJJChartStyle){
    HJJChartStyleLine = 0,
    HJJChartStyleBar = 1,
    HJJChartStylePie
};

//协议
@protocol HJJChartDataSource <NSObject>

@required
//数据必须是实现

//横坐标标题数组
- (NSArray *)chartConfigXLabel:(HJJChartView *)chart;

//数值多重数组
- (NSArray *)chartConfigYValue:(HJJChartView *)chart;


@optional
//其他的图形的特定的属性

//颜色数组
- (NSArray *)chartConfigColors:(HJJChartView *)chart;

//显示数值范围 及数据能展示的范围 折线图条形图可实现
- (CGRange)chartRange:(HJJChartView *)chart;


#pragma mark -- 折线图专属使用的方法

//折线图专用
//显示点
- (BOOL)showPointonChart:(HJJChartView *)chartview;

//显示折线图上的label
- (BOOL)showPointLabelOnChart:(HJJChartView *)chartview;

//折线图的宽度
- (CGFloat)lineBorderWidthInChart:(HJJChartView *)chartview;
//折线图条形图 每一个数据源占的宽度
- (CGFloat)linPointWidthInChart:(HJJChartView *)chartView;

#pragma mark -- 条形图使用方法

//条形图单元的宽度
- (CGFloat)unitBarWidthInChart:(HJJChartView *)chartView;

//饼状图宽度
- (CGFloat)pieWitdthInChart:(HJJChartView *)chartview;

//饼图各个部分占的比例
- (void)dataProportionArrayInChart:(HJJChartView *)chartview Portionarr:(NSMutableArray *)parr;

@end


@interface HJJChartView : UIView

//图表样式
@property (assign , nonatomic)HJJChartStyle style;

//数据比例数组 用于饼图的返回比例
@property (strong , nonatomic , readonly)NSMutableArray *dataProportion;

- (instancetype)initWithFrame:(CGRect )frame dataSource:(id<HJJChartDataSource>)dataSource style:(HJJChartStyle)style;

- (void)showInView:(UIView *)view;

- (void)startViewDrawing;




@end
