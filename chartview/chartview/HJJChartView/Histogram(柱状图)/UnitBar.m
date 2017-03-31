//
//  UnitBar.m
//  chartview
//
//  Created by hejingjin on 17/3/30.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "UnitBar.h"

@implementation UnitBar

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        _unitlayer = [CAShapeLayer layer];
        _unitlayer.lineCap = kCALineCapSquare;
        _unitlayer.lineWidth = self.frame.size.width;
        _unitlayer.fillColor = [UIColor whiteColor].CGColor;
//        _unitlayer.strokeEnd = 0.0;
        [self.layer addSublayer:_unitlayer];
        
    }
    return self;
}
//设置比例
-(void)setProportion:(CGFloat)proportion{
    _proportion = proportion;
    if (_proportion == 0) {
        return;
    }
    
    UIBezierPath *linepath = [UIBezierPath bezierPath];
    
    [linepath moveToPoint:CGPointMake(self.frame.size.width/2, self.frame.size.height)];
    
    [linepath addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height * (1 - _proportion))];
    [linepath setLineWidth:1.0];
    [linepath setLineCapStyle:kCGLineCapSquare];
    
    _unitlayer.path = linepath.CGPath;
    _unitlayer.strokeColor = _unitbarcolor.CGColor ?: [UIColor redColor].CGColor;
//    _unitlayer.strokeColor = [UIColor redColor].CGColor;
    
    
}



@end
