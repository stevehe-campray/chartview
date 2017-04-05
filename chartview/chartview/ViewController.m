//
//  ViewController.m
//  chartview
//
//  Created by hejingjin on 17/3/30.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "ViewController.h"
#import "UnitBar.h"

#import "HistogramView.h"
#import "HJJChartView/PieChart(饼图)/HJJPieLayer.h"

#import "PieChartView.h"
#import "BrokenlineView.h"

#import "HJJChartView.h"
@interface ViewController ()<HJJChartDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //单个视图使用
//    [self setUpMainInterface];
    
    //通过代理使用
    [self setUpdataSourceMainInterface];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setUpdataSourceMainInterface{
    
    //条形图
    HJJChartView *chartview1 = [[HJJChartView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 150) dataSource:self style:HJJChartStyleLine];
    chartview1.backgroundColor = [UIColor lightGrayColor];
    [chartview1 startViewDrawing];
    [self.view addSubview:chartview1];
    
    //柱状图
    HJJChartView *chartview2 = [[HJJChartView alloc] initWithFrame:CGRectMake(0, 250, self.view.frame.size.width, 150) dataSource:self style:HJJChartStyleBar];
    
    [chartview2 startViewDrawing];
    [self.view addSubview:chartview2];
    
    //饼状图
    HJJChartView *chartview3 = [[HJJChartView alloc] initWithFrame:CGRectMake(0, 420, 100, 100) dataSource:self style:HJJChartStylePie];
    chartview3.tag = 1001;
    [chartview3 startViewDrawing];
    [self.view addSubview:chartview3];
    
    
}




- (void)setUpMainInterface{
    


    NSArray *Xvalue1 = @[@"X1",@"X2",@"X3",@"X4",@"X5",@"X6",@"X7",@"X8",@"X9",@"X10",@"X11"];
    
    
    NSArray *ary1 = @[@"22",@"54",@"16",@"30",@"42",@"77",@"43"];
    NSArray *ary2 = @[@"76",@"34",@"54",@"23",@"16",@"32",@"17"];
    NSArray *yarray = @[ary1,ary2];
    
    
    NSArray *colorarr = @[[UIColor redColor],[UIColor greenColor]];
    
    HistogramView *historamview1 = [[HistogramView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 300)];
    
    
    [historamview1 setYvaluesArray:yarray];
    historamview1.unitbarWith = 40;
    historamview1.XnameArray = Xvalue1;
    historamview1.colors = colorarr;
    historamview1.proportion = 0.2;
    
    [historamview1 strokeChart];
    [self.view addSubview:historamview1];
    
    
    PieChartView *pieview = [[PieChartView alloc] initWithFrame:CGRectMake(40, 400, 100, 100)];
    
    NSArray *colorarr1 = @[[UIColor redColor],[UIColor greenColor],[UIColor orangeColor]];
    
    NSArray *ary3 = @[@"76",@"34",@"54"];
    
    [pieview setDataarray:ary3];
    [pieview setColors:colorarr1];
    pieview.pieWitdth = 25;
    [pieview startDrawing];
    pieview.transform = CGAffineTransformRotate(pieview.transform, - M_PI / 2);
    pieview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:pieview];
    
    NSArray *parray = pieview.dataProportion;
    
    NSLog(@"%@",parray);
    
    
    BrokenlineView *brokenline = [[BrokenlineView alloc] initWithFrame:CGRectMake(0, 530, 100, 100)];
    
    [brokenline setYvalueArray:@[ary1,ary2]];
    
    [brokenline setXnameArray:Xvalue1];
    
    [brokenline setColors:colorarr];
    
    [brokenline startDarwing];
    
    [self.view addSubview:brokenline];
    
    
    
    
    
    
//    HistogramView *historamview = [[HistogramView alloc] initWithFrame:CGRectMake(0, 350, self.view.frame.size.width, 400)];
//    
//    
//    
//    
//    [self.view addSubview:historamview];
}



#pragma mark -- 代理方法

//横坐标标题数组
- (NSArray *)chartConfigXLabel:(HJJChartView *)chart{
    NSArray *Xvalue1 = @[@"X1",@"X2",@"X3",@"X4",@"X5",@"X6",@"X7",@"X8",@"X9",@"X10",@"X11"];
    
    return Xvalue1;
    
}

//数值多重数组
- (NSArray *)chartConfigYValue:(HJJChartView *)chart{
   
    NSArray *ary1 = @[@"22",@"54",@"16",@"30",@"42",@"77",@"43"];
    NSArray *ary2 = @[@"76",@"34",@"54",@"23",@"16",@"32",@"17"];
    NSArray *arr3 = @[@"230",@"130",@"221"];
    NSArray *yarray = @[ary1,ary2];
    
    
    if (chart.tag == 1001) {
        return arr3;
    }else{
        return yarray;
    }
  
}


//颜色数组
- (NSArray *)chartConfigColors:(HJJChartView *)chart{
    
     NSArray *colorarr = @[[UIColor redColor],[UIColor greenColor],[UIColor blueColor]];
     return colorarr;
    
}

//显示数值范围 及数据能展示的范围 折线图条形图可实现
- (CGRange)chartRange:(HJJChartView *)chart{
    
    return CGRangeMake(100,10);
}


#pragma mark -- 折线图可实现
//显示点
- (BOOL)showPointonChart:(HJJChartView *)chartview{
    return NO;
}

//显示折线图上的label
- (BOOL)showPointLabelOnChart:(HJJChartView *)chartview{
    return YES;
}

//折线图的宽度
- (CGFloat)lineBorderWidthInChart:(HJJChartView *)chartview{
    return 1.f;
}
//折线图条形图 每一个数据源占的宽度
- (CGFloat)linPointWidthInChart:(HJJChartView *)chartView{
    return 50.f;
}

//条形图单元的宽度
- (CGFloat)unitBarWidthInChart:(HJJChartView *)chartView{
    
    return 15.f;
}

//饼状图宽度
- (CGFloat)pieWitdthInChart:(HJJChartView *)chartview{
    return 10.f;
}


@end
