//
//  HistogramView.m
//  chartview
//
//  Created by hejingjin on 17/3/30.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "HistogramView.h"
#import "HJJStyleLabel.h"
#import "UnitBar.h"

@implementation HistogramView{
   UIScrollView *_barscollview;
   NSHashTable *_chartLabelsForX;
   CGFloat _xLabelWidth;//每一组值X轴的宽度
    //最大值
   float _yValueMax;
    //最小值
   float _yValueMin;
}


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        _barscollview = [[UIScrollView alloc] initWithFrame:CGRectMake(HJJYLabelwidth, 0, frame.size.width - HJJYLabelwidth, frame.size.height)];
        _unitbarWith = _barscollview.frame.size.width / 8;
        _proportion = 0.1;
//        _barscollview.showsVerticalScrollIndicator = NO;
        _barscollview.showsHorizontalScrollIndicator = NO;
        [self addSubview:_barscollview];
    }
    return self;
}

//初始化条形图数据
-(void)setYvaluesArray:(NSArray *)YvaluesArray{
    
    _YvaluesArray = YvaluesArray;
    _xLabelWidth = _unitbarWith * [_YvaluesArray count];
    //计算最大最小值
    NSInteger max = 0;
    NSInteger min = 100000000;
    for (NSArray * ary in YvaluesArray) {
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

//Y轴
-(void)setChooseRange:(CGRange)chooseRange{
    _chooseRange = chooseRange;
    
}

//初始化横坐标
-(void)setXnameArray:(NSArray *)XnameArray{
    if( !_chartLabelsForX ){
        _chartLabelsForX = [NSHashTable weakObjectsHashTable];
    }
    _XnameArray = XnameArray;
    
    _xLabelWidth = _unitbarWith * _YvaluesArray.count;
    for (int i=0; i<XnameArray.count; i++) {
        HJJStyleLabel * label = [[HJJStyleLabel alloc] initWithFrame:CGRectMake((i *  _xLabelWidth ), self.frame.size.height - HJJLabelHeight, _xLabelWidth, HJJLabelHeight)];
        label.text = XnameArray[i];
        [_barscollview addSubview:label];
        [_chartLabelsForX addObject:label];
    }
    //计算x轴的距离
    float max = (([XnameArray count]-1)*_xLabelWidth + chartMargin)+_xLabelWidth;
    if (_barscollview.frame.size.width < max-10) {
        _barscollview.contentSize = CGSizeMake(max, self.frame.size.height);
    }
}

-(void)setColors:(NSArray *)colors{
    _colors = colors;
}

-(void)setUnitbarWith:(float)unitbarWith{
    _unitbarWith = unitbarWith;
    
    if (_YvaluesArray.count == 0) {
        _xLabelWidth = _unitbarWith * 8;
    }else{
        _xLabelWidth = _unitbarWith * _YvaluesArray.count;
    }
}

//画条形图
- (void)strokeChart{
    
    CGFloat chartCavanHeight = self.frame.size.height - HJJLabelHeight*3;
    CGFloat unitwith = _unitbarWith;
    for (int i = 0; i< _YvaluesArray.count; i ++) {
        NSArray *childarray = _YvaluesArray[i];
        for (int j =0; j< childarray.count; j++) {
            CGFloat proportion = ([childarray[j] floatValue] - _yValueMin)/(_yValueMax - _yValueMin);
            UnitBar *unitbar = [[UnitBar alloc] initWithFrame:CGRectMake(j * _xLabelWidth +i*unitwith, HJJLabelHeight, unitwith *(1- _proportion), chartCavanHeight - HJJLabelHeight)];
            unitbar.unitbarcolor = [_colors objectAtIndex:i];
            unitbar.proportion = proportion;
            [_barscollview addSubview:unitbar];
        }
    }
    
    
}

- (NSArray *)chartLabelsForX
{
    return [_chartLabelsForX allObjects];
}

@end
