//
//  viewTwo.m
//  AnimationForSJ
//
//  Created by SJ on 16/7/21.
//  Copyright © 2016年 SJ. All rights reserved.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#import "viewTwo.h"

@interface viewTwo()
//获取输入的值
@property(nonatomic,strong)NSString *str;
@property(nonatomic,strong)UITextField *field;
@property(nonatomic,strong)CAShapeLayer *sLayer;
@end


@implementation viewTwo

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)createView{
    [self createBtnAndTextField];
    _sLayer = [CAShapeLayer new];

    CAGradientLayer *gLayer = [[CAGradientLayer alloc]init];
    gLayer.frame = CGRectMake(20, 200, kScreenWidth, 300);
    gLayer.colors = @[(id)[UIColor blueColor].CGColor,(id)[UIColor redColor].CGColor];
    gLayer.startPoint = CGPointMake(0, 0.5);
    gLayer.endPoint = CGPointMake(1, 0.5);
    
    CAShapeLayer *sLayer = [CAShapeLayer new];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 120) radius:95 startAngle:M_PI/6*5 endAngle:M_PI/6 clockwise:YES];
    sLayer.lineWidth = 15;
    sLayer.strokeColor = [UIColor whiteColor].CGColor;
    sLayer.fillColor = [UIColor clearColor].CGColor;
    
    sLayer.path = path.CGPath;
    gLayer.mask = sLayer;
    
    [self.layer addSublayer:gLayer];
    }

-(void)createBtnAndTextField{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 40, 80, 40)];
    label.text = @"请输入温度";
    label.font = [UIFont fontWithName:@"Arial" size:15.0];
    label.textColor = [UIColor redColor];
    [self addSubview:label];
    
    _field = [[UITextField alloc]initWithFrame:CGRectMake(120, 40, 80, 40)];
    _field.placeholder = @"输入温度";
    _field.font = [UIFont fontWithName:@"Arial" size:15];
    _field.userInteractionEnabled = YES;
    [_field setBorderStyle:UITextBorderStyleRoundedRect];
    [self addSubview:_field];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(250, 40, 80, 40)];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blackColor];
    btn.alpha = 0.5;
    btn.userInteractionEnabled = YES;
    btn.layer.cornerRadius = 5;
    [btn addTarget:self action:@selector(getStr) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
}

-(void)getStr{
    
    _str =  _field.text;
    float tem = [_str floatValue];
    if(tem<0 || tem>100){
        NSLog(@"sss");
    }else{
    NSLog(@"%lf",tem);
    tem = (M_PI/6*5+tem/100*M_PI/3*4);
    NSLog(@"%f",90*cos(tem));
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(170, 320)];
    [path addLineToPoint:CGPointMake(170 + 90*cos(-tem), 320+90*sin(tem))];
    _sLayer.lineWidth = 5;
    _sLayer.strokeColor = [UIColor blackColor].CGColor;
    _sLayer.path = path.CGPath;
    [self.layer addSublayer:_sLayer];
    }
}

@end
