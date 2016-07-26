//
//  viewFour.m
//  AnimationForSJ
//
//  Created by SJ on 16/7/24.
//  Copyright © 2016年 SJ. All rights reserved.
//

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#import "viewFour.h"

@interface viewFour()

@property(nonatomic, assign)NSInteger offset;
@property(nonatomic, strong)CAShapeLayer *sLayer;
@property(nonatomic, strong)CAGradientLayer *gLayer;
@property(nonatomic, strong)NSTimer *timer;
@end

@implementation viewFour

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)createView{
    //这个半径不是你看到的圆的半径，而是每一条直线所在的glayer的内切圆圆的半径，即你所看到的圆的半径的一半
    NSInteger r = (self.frame.size.width>self.frame.size.height?self.frame.size.width:self.frame.size.height)*0.25;
    //渐变色数组
    NSMutableArray *colors = [NSMutableArray array];
    for (NSInteger deg = 0;deg <= 360; deg += 5) {
        NSInteger newDeg = deg%360;
        UIColor *color;
        color = [UIColor colorWithHue:1.0 * newDeg / 360.0
                           saturation:1.0
                           brightness:1.0
                                alpha:1.0];
        [colors addObject:(id)[color CGColor]];
    }
    //精度，每1°所含的直线的条数
    NSInteger tap = 3;
    //开始循环创建直线
    for (int i = 0; i<360*tap; i++) {
        CAGradientLayer *gLayer = [CAGradientLayer new];
        gLayer.frame = CGRectMake(r+r*cos(i/(180.0*tap)*M_PI), r+r*sin(i/(180.0*tap)*M_PI), 100, 100);
        gLayer.cornerRadius = r;
        gLayer.masksToBounds = YES;
        gLayer.colors = colors;
        //上面都没有问题，我们从gLayer中取到的直线，是该视图内切圆的直径，所以渐变的起点和终点该是内切圆上的点而不是视图的矩形边界，因为矩形各个角度的长度是不同的，如果放在矩形边界，渐变会有各种不同程度的拉伸，对角线渐变最慢，长宽较短的一边渐变最慢。环形渐变需要所有的直线渐变拉伸都是统一的
        //这里我觉得文字解释略显乏力，你努力想象吧，每条直线背后的gLayer的渐变方向都是不一样的，这样才能造成每条直线都是从圆心到圆上的渐变方向
        gLayer.startPoint = CGPointMake(0.5-cos(i/(180.0*tap)*M_PI)*0.5, 0.5-sin(i/(180.0*tap)*M_PI)*0.5);
        gLayer.endPoint = CGPointMake(0.5+cos(i/(180.0*tap)*M_PI)*0.5, 0.5+sin(i/(180.0*tap)*M_PI)*0.5);
        
        
        CAShapeLayer *sLayer = [CAShapeLayer new];
        UIBezierPath *path = [UIBezierPath bezierPath];
        //这也没有问题，直线方向跟渐变方向一直
        [path moveToPoint:CGPointMake(r-r*cos(i/(180.0*tap)*M_PI), r-r*sin(i/(180.0*tap)*M_PI))];
        [path addLineToPoint:CGPointMake(r+r*cos(i/(180.0*tap)*M_PI), r+r*sin(i/(180.0*tap)*M_PI))];
        sLayer.path = path.CGPath;
        sLayer.fillColor = [UIColor clearColor].CGColor;
        sLayer.strokeColor = [UIColor whiteColor].CGColor;
        sLayer.lineWidth = 1;
        gLayer.mask = sLayer;
        [self.layer addSublayer:gLayer];
        
    }

  
    
}



@end
