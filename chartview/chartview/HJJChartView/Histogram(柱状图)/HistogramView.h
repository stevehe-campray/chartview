//
//  HistogramView.h
//  chartview
//
//  Created by hejingjin on 17/3/30.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJJConst.h"

@interface HistogramView : UIView


//条形图数据数组
@property(nonatomic,copy)NSArray *YvaluesArray;

//多组条形图混合
@property (nonatomic,copy)NSArray * colors;

//X轴标题名字数组
@property(nonatomic,copy)NSArray *XnameArray;

//Y轴范围
@property (nonatomic) CGRange chooseRange;

//每一个条形单元的宽度
@property (nonatomic) float unitbarWith;

//间隔比例  值越大  对应的条形单元久越小
@property (nonatomic,assign)float proportion;

//画条行图
- (void)strokeChart;

@end
