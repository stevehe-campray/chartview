//
//  HJJChartView.m
//  chartview
//
//  Created by hejingjin on 17/4/5.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "HJJChartView.h"
#import "PieChartView.h"
#import "BrokenlineView.h"
#import "HistogramView.h"

@interface HJJChartView ()

@property (strong, nonatomic) BrokenlineView * brokenlineview;

@property (strong, nonatomic) HistogramView * histogramview;

@property (strong, nonatomic) PieChartView *piechartview;

@property (assign, nonatomic) id<HJJChartDataSource> dataSource;

@end

@implementation HJJChartView

-(instancetype)initWithFrame:(CGRect)frame dataSource:(id<HJJChartDataSource>)dataSource style:(HJJChartStyle)style{
    self.dataSource = dataSource;
    self.style = style;
    return [self initWithFrame:frame];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = NO;
    }
    return self;
}


//初始化图形

-(void)SetUpChartViewInterface{
  
    if (_style == HJJChartStyleLine) {
          //折线图
          //判断是否为空
        if (!_brokenlineview) {
            _brokenlineview = [[BrokenlineView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            
            [self addSubview:_brokenlineview];
        }
        
        //选择显示范围
        if ([self.dataSource respondsToSelector:@selector(chartRange:)]) {
            [_brokenlineview setChooseRange:[self.dataSource chartRange:self]];
        }
        
        //显示颜色
        if ([self.dataSource respondsToSelector:@selector(chartConfigColors:)]) {
            [_brokenlineview setColors:[self.dataSource chartConfigColors:self]];
        }
        
        //设置折线宽度
        if ([self.dataSource respondsToSelector:@selector(lineBorderWidthInChart:)]) {
            
            [_brokenlineview setBorderwidth:[self.dataSource lineBorderWidthInChart:self]];
            
        }
        //一个数据源的宽度
        if ([self.dataSource respondsToSelector:@selector(linPointWidthInChart:)]) {
            [_brokenlineview setXwidth:[self.dataSource linPointWidthInChart:self]];
        }
        
        if ([self.dataSource respondsToSelector:@selector(showPointonChart:)]) {
            [_brokenlineview setIshiddenPoint:[self.dataSource showPointonChart:self]];
        }
        
        if ([self.dataSource respondsToSelector:@selector(showPointLabelOnChart:)]) {
            [_brokenlineview setIshiddenLabel:[self.dataSource showPointLabelOnChart:self]];
        }
        //配置数据
        [_brokenlineview setYvalueArray:[self.dataSource chartConfigYValue:self]];
        [_brokenlineview setXnameArray:[self.dataSource chartConfigXLabel:self]];
        
        [_brokenlineview startDarwing];
        
        
    }else if (_style == HJJChartStyleBar){
          //条形图
//        HistogramView
        if (!_histogramview) {
            _histogramview = [[HistogramView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            [self addSubview:_histogramview];
        }
        
        
        //选择显示范围
        if ([self.dataSource respondsToSelector:@selector(chartRange:)]) {
            [_histogramview setChooseRange:[self.dataSource chartRange:self]];
        }
        
        //显示颜色
        if ([self.dataSource respondsToSelector:@selector(chartConfigColors:)]) {
            [_histogramview setColors:[self.dataSource chartConfigColors:self]];
        }
        
        //条形单元大小
        if ([self.dataSource respondsToSelector:@selector(unitBarWidthInChart:)]) {
            [_histogramview setUnitbarWith:[self.dataSource unitBarWidthInChart:self]];
        }
        
        //配置数据
        [_histogramview setYvaluesArray:[self.dataSource chartConfigYValue:self]];
        [_histogramview setXnameArray:[self.dataSource chartConfigXLabel:self]];
        
        [_histogramview strokeChart];
        
    }else{
          //饼状图
        
        if (!_piechartview) {
            _piechartview = [[PieChartView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            [self addSubview:_piechartview];
        }
        
        
        _piechartview.transform = CGAffineTransformRotate(_piechartview.transform, - M_PI / 2);
        //显示颜色
        if ([self.dataSource respondsToSelector:@selector(chartConfigColors:)]) {
            [_piechartview setColors:[self.dataSource chartConfigColors:self]];
        }
        
        if ([self.dataSource respondsToSelector:@selector(pieWitdthInChart:)]){
            [_piechartview setPieWitdth:[self.dataSource pieWitdthInChart:self]];
        }
        //配置数据
        [_piechartview setDataarray:[self.dataSource chartConfigYValue:self]];
        [_piechartview startDrawing];
        
        [self.dataSource dataProportionArrayInChart:self Portionarr:_piechartview.dataProportion];
    }
    
    
}


-(void)showInView:(UIView *)view{
    
    [self SetUpChartViewInterface];
    
    [view addSubview:self];
}


//绘画
- (void)startViewDrawing{
    
    [self SetUpChartViewInterface];
    
}

@end
