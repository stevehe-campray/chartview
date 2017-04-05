//
//  BrokenlineView.m
//  chartview
//
//  Created by hejingjin on 17/3/31.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "BrokenlineView.h"
#import "HJJStyleLabel.h"


@implementation BrokenlineView{
    
    
    UIScrollView *_barscollview;
    //最大值
    float _yValueMax;
    //最小值
    float _yValueMin;
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        _barscollview = [[UIScrollView alloc] initWithFrame:CGRectMake(HJJYLabelwidth, 0, frame.size.width - HJJYLabelwidth, frame.size.height)];
        _barscollview.showsHorizontalScrollIndicator = NO;
        
        _xwidth = _barscollview.frame.size.width/10;
        _borderwidth = 2;
        _ishiddenPoint = NO;
        _ishiddenLabel = NO;
        [self addSubview:_barscollview];
    }
    return self;
}


-(void)setYvalueArray:(NSArray *)yvalueArray{
    _yvalueArray = yvalueArray;
//    _xLabelWidth = _unitbarWith * [_yvalueArray count];
    //计算最大最小值
    NSInteger max = 0;
    NSInteger min = 100000000;
    for (NSArray * ary in yvalueArray) {
        for (NSString *valueString in ary) {
            NSInteger value = [valueString integerValue];
            if (value > max) {
                max = value;
            }
            if (value < min) {
                min = value;
            }
        }
    }
    if (max < 5) {
        max = 5;
    }
    _yValueMin = 0;
    _yValueMax = (int)max;
    
    //更改Y轴范围
    if (_chooseRange.max!=_chooseRange.min) {
        _yValueMax = _chooseRange.max;
        _yValueMin = _chooseRange.min;
    }
    float level = (_yValueMax-_yValueMin) /4.0;
    CGFloat chartCavanHeight = self.frame.size.height - HJJLabelHeight*3;
    CGFloat levelHeight = chartCavanHeight /4.0;
    for (int i=0; i<5; i++) {
        HJJStyleLabel * label = [[HJJStyleLabel alloc] initWithFrame:CGRectMake(0.0,chartCavanHeight-i*levelHeight+5, HJJYLabelwidth, HJJLabelHeight)];
        label.text = [NSString stringWithFormat:@"%.1f",level * i+_yValueMin];
        [self addSubview:label];
    }
}


-(void)setXnameArray:(NSArray *)xnameArray{
    
    _xnameArray = xnameArray;
    for (int i = 0; i < [xnameArray count]; i ++) {
            HJJStyleLabel * label = [[HJJStyleLabel alloc] initWithFrame:CGRectMake((i *  _xwidth ), self.frame.size.height - HJJLabelHeight, _xwidth, HJJLabelHeight)];
            label.text = xnameArray[i];
            [_barscollview addSubview:label];
    }
    //计算x轴的距离
    float max = (([xnameArray count]-1)*_xwidth + chartMargin)+_xwidth;
    if (_barscollview.frame.size.width < max-10) {
        _barscollview.contentSize = CGSizeMake(max, self.frame.size.height);
    }
}

-(void)startDarwing{
    
    for (int i =0; i < _yvalueArray.count; i ++) {
        
        
        NSArray *chlidarray = _yvalueArray[i];
        
        
        if (chlidarray.count == 0) {
            return;
        }
        
        //折线图层
        CAShapeLayer *brokenlinelayer = [CAShapeLayer layer];
        brokenlinelayer.lineCap = kCALineCapRound;
        brokenlinelayer.lineJoin = kCALineJoinBevel;
        brokenlinelayer.fillColor = [UIColor whiteColor].CGColor;
        brokenlinelayer.borderWidth = _borderwidth;
        brokenlinelayer.strokeEnd = 1;
        [_barscollview.layer addSublayer:brokenlinelayer];
        
        
        //图层路径
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        CGFloat firstpointvalue = [[chlidarray objectAtIndex:0] floatValue];
        
        //画图的高度
        CGFloat chartCavanHeight = self.frame.size.height - HJJLabelHeight * 3;
        
        float proportion = ((float)firstpointvalue-_yValueMin) / ((float)_yValueMax-_yValueMin);
        
        CGFloat pointcenterX =_xwidth/2;
        
        CGFloat pointcenterY = chartCavanHeight - proportion * chartCavanHeight + HJJLabelHeight;
        
        
        CGPoint point =  CGPointMake(pointcenterX, pointcenterY);
        //添加点
        [self addPoint:point index:i isShow:NO value:firstpointvalue];
        
        
        //设置起点以及路径属性
        [path moveToPoint:point];
         path.lineWidth = 2;
        [path setLineCapStyle:kCGLineCapRound];
        [path setLineJoinStyle:kCGLineJoinRound];
        
        for (int j = 1; j < chlidarray.count; j++) {
            
            CGFloat pointvalue = [[chlidarray objectAtIndex:j] floatValue];
            
            //画图的高度
            CGFloat chartCavanHeight = self.frame.size.height - HJJLabelHeight * 3;
            
            float proportion = ((float)pointvalue-_yValueMin) / ((float)_yValueMax-_yValueMin);
            
            CGFloat pointcenterX =_xwidth/2 + j * _xwidth;
            
            CGFloat pointcenterY = chartCavanHeight - proportion * chartCavanHeight + HJJLabelHeight;
            
            
            CGPoint point =  CGPointMake(pointcenterX, pointcenterY);
            
            [path addLineToPoint:point];
            
            [self addPoint:point index:i isShow:NO value:pointvalue];
            
            [path moveToPoint:point];
            
            
        }
        
        
        brokenlinelayer.path = path.CGPath;
        if ([[_colors objectAtIndex:i] CGColor]) {
            brokenlinelayer.strokeColor = [[_colors objectAtIndex:i] CGColor];
        }else{
            brokenlinelayer.strokeColor = [UIColor greenColor].CGColor;
        }
        
    }
    
    
}



/**
 *  创建数据点 与记录数据点的值
 *
 *  @param point    创建点的中心点
 *  @param index    第几个点
 *  @param isHollow 是否隐藏
 *  @param value    y值
 */
- (void)addPoint:(CGPoint)point index:(NSInteger)index isShow:(BOOL)isHollow value:(CGFloat)value{
    
    UIView *pointview = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 8, 8)];
    pointview.center = point;
    pointview.layer.cornerRadius = 4.f;
    pointview.layer.borderWidth = 2.f;
    pointview.layer.masksToBounds = YES;
    pointview.layer.borderColor = [[_colors objectAtIndex:index] CGColor]?[[_colors objectAtIndex:index] CGColor]:[UIColor greenColor].CGColor;
    
    
    if (isHollow) {
        pointview.backgroundColor = [UIColor whiteColor];
    }else{
        pointview.backgroundColor = [_colors objectAtIndex:index]?[_colors objectAtIndex:index]:[UIColor greenColor];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(point.x-HJJTagLabelwidth/2.0, point.y-HJJLabelHeight*2, HJJTagLabelwidth, HJJLabelHeight)];
        label.font = [UIFont systemFontOfSize:10];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = pointview.backgroundColor;
        label.text = [NSString stringWithFormat:@"%.1f",value];
        label.hidden = !_ishiddenLabel;
        [_barscollview addSubview:label];
    }
    [_barscollview addSubview:pointview];
    pointview.hidden = !_ishiddenPoint;
    
  
    
}


@end
