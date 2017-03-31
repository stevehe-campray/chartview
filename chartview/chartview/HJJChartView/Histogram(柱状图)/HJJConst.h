//
//  HJJConst.h
//  chartview
//
//  Created by hejingjin on 17/3/31.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define chartMargin         10
#define xLabelMargin        15
#define yLabelMargin        15
#define HJJLabelHeight       10
#define HJJYLabelwidth       30
#define HJJTagLabelwidth     80


//范围
struct Range {
    CGFloat max;
    CGFloat min;
};
typedef struct Range CGRange;
CG_INLINE CGRange CGRangeMake(CGFloat max, CGFloat min);

CG_INLINE CGRange
CGRangeMake(CGFloat max, CGFloat min){
    CGRange p;
    p.max = max;
    p.min = min;
    return p;
}




@interface HJJConst : UIColor

@end
