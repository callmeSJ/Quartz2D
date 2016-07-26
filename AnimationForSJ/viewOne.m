//
//  viewOne.m
//  AnimationForSJ
//
//  Created by SJ on 16/7/19.
//  Copyright © 2016年 SJ. All rights reserved.
//

#import "viewOne.h"

@implementation viewOne

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)createView{
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    UIBezierPath *path = [UIBezierPath bezierPath];
    layer.lineWidth = 10;
    layer.strokeColor = [UIColor blackColor].CGColor;
    layer.fillColor = [UIColor whiteColor].CGColor;
    [path moveToPoint:CGPointMake(350, 100)];
    [path addLineToPoint:CGPointMake(325, 125)];
    layer.lineCap = kCALineCapRound;
    layer.path = path.CGPath;
    [self.layer addSublayer:layer];
    
    //直接在第一个layer上画，会出现一个半径的直线。去不掉= =
    
    CAShapeLayer *layer2 = [[CAShapeLayer alloc]init];
    UIBezierPath *path2 = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(225, 225)];
    layer2.lineWidth = 10;
    layer2.fillColor = [UIColor whiteColor].CGColor;
    layer2.strokeColor = [UIColor blackColor].CGColor;
    layer2.lineCap = kCALineCapRound;
    float x = sqrtf(7200);
    [path2 addArcWithCenter:CGPointMake(265, 185) radius:x startAngle:-M_PI_4 endAngle:M_PI-M_PI_4 clockwise:0];
    
    x = sqrtf(4800);
    [path2 addArcWithCenter:CGPointMake(255, 197) radius:x startAngle:M_PI-M_PI_4 endAngle:-M_PI_4 clockwise:0];
    x = sqrtf(3200);
    [path2 addArcWithCenter:CGPointMake(263, 187) radius:x startAngle:-M_PI_4 endAngle:M_PI-M_PI_4 clockwise:0];
    x = sqrtf(800);
    [path2 addArcWithCenter:CGPointMake(243, 207) radius:x startAngle:M_PI-M_PI_4 endAngle:-(M_PI/3) clockwise:0];
    
    layer2.path = path2.CGPath;
    [self.layer addSublayer:layer2];
    
    CAShapeLayer *layer3 = [[CAShapeLayer alloc]init];
    UIBezierPath *path3 = [UIBezierPath bezierPath];
    layer3.lineWidth = 10;
    layer3.lineCap = kCALineCapRound;
    layer3.fillColor = [UIColor whiteColor].CGColor;
    layer3.strokeColor = [UIColor blackColor].CGColor;
    [path3 moveToPoint:CGPointMake(160, 290)];
    [path3 addLineToPoint:CGPointMake(180, 200)];
    
    [path3 moveToPoint:CGPointMake(160, 290)];
    [path3 addLineToPoint:CGPointMake(250, 266)];
    layer3.path = path3.CGPath;
    [self.layer addSublayer:layer3];
    
    
    
    
    
    

}

@end
