//
//  PieChartView.m
//  chartview
//
//  Created by hejingjin on 17/3/31.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "PieChartView.h"
#import "HJJPieLayer.h"
@implementation PieChartView{
    
    CALayer *_baseLayer;//底层layer
    CGFloat _total;
    NSMutableArray *_proportionArray;
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        _baseLayer =  [[CALayer alloc] init];
        _baseLayer.frame = self.bounds;
        _proportionArray = [NSMutableArray array];
        [self.layer addSublayer:_baseLayer];
    }
    
    return self;
    
}

- (void)setDataarray:(NSArray *)dataarray{
    _dataarray = dataarray;
    for (NSString *titlestr in dataarray) {
        _total += [titlestr floatValue];
    }
    for (NSString *titlestr in dataarray) {
        [_proportionArray addObject:[NSString stringWithFormat:@"%.4f",([titlestr floatValue]/_total)]];
    }
    _dataProportion = _proportionArray;
}

- (void)setColors:(NSArray *)colors{
    _colors = colors;
}

//开始绘画
-(void)startDrawing{
    
    CGFloat startlocation = 0;
    CGFloat endlocation = 0;
    for (int i = 0; i<[_dataarray count]; i++) {
        CGFloat floatvalue = [_proportionArray[i] floatValue];
        endlocation += floatvalue;
        HJJPieLayer *layer = [HJJPieLayer layer];
        layer.layerwidth = _pieWitdth;
        layer.circleradius = self.frame.size.width/2;
        layer.layerunitcolor = _colors[i];
        layer.centrtpoint = CGPointMake(self.frame.size.width/2, self.frame.size.width/2);
        layer.startlocation = startlocation;
        layer.endlocation = M_PI * 2 * endlocation;
        startlocation = layer.endlocation;
        [layer startpielayer];
        [_baseLayer addSublayer:layer];
    }
    
}


@end
