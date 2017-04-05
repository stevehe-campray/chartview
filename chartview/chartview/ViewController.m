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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUpMainInterface];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    pieview.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:pieview];
    
    NSArray *parray = pieview.dataProportion;
    
    NSLog(@"%@",parray);
    
    
    BrokenlineView *brokenline = [[BrokenlineView alloc] initWithFrame:CGRectMake(0, 530, self.view.frame.size.width, 150)];
    
    [brokenline setYvalueArray:@[ary1]];
    
    [brokenline setXnameArray:Xvalue1];
    
    [self.view addSubview:brokenline];
    
    
    
    
    
    
//    HistogramView *historamview = [[HistogramView alloc] initWithFrame:CGRectMake(0, 350, self.view.frame.size.width, 400)];
//    
//    
//    
//    
//    [self.view addSubview:historamview];
}

@end
