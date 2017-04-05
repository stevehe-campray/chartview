# chartview
###   //条形图
    HJJChartView *chartview1 = [[HJJChartView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 150) dataSource:self style:HJJChartStyleLine];
    chartview1.backgroundColor = [UIColor lightGrayColor];
    [chartview1 startViewDrawing];
    [self.view addSubview:chartview1];
