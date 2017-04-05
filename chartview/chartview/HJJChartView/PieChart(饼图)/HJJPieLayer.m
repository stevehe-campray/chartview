//
//  HJJPieLayer.m
//  chartview
//
//  Created by hejingjin on 17/3/31.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "HJJPieLayer.h"

@implementation HJJPieLayer

-(void)startpielayer{
    
    self.fillColor = [UIColor clearColor].CGColor;
    self.strokeColor = _layerunitcolor.CGColor? :[UIColor lightGrayColor].CGColor;
    self.lineWidth = _layerwidth;
    self.contentsScale = [UIScreen mainScreen].scale;

    
    //圆饼路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:_centrtpoint radius:(_circleradius - _layerwidth/2.0) startAngle:_startlocation endAngle:_endlocation clockwise:YES];
    self.path = path.CGPath;
    
    
    
}
@end
