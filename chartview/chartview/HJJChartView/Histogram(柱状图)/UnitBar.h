//
//  UnitBar.h
//  chartview
//
//  Created by hejingjin on 17/3/30.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnitBar : UIView

@property(nonatomic,assign) CGFloat proportion; //比例

@property(nonatomic,strong) CAShapeLayer *unitlayer; //条形单元条

@property(nonatomic,strong) UIColor *unitbarcolor;

@end
