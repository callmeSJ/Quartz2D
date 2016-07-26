//
//  viewThree.m
//  AnimationForSJ
//
//  Created by SJ on 16/7/22.
//  Copyright © 2016年 SJ. All rights reserved.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#import "viewThree.h"
@interface viewThree()
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)CAGradientLayer *gLayer;
@property(nonatomic,strong)CAShapeLayer *sLayer;

//偏移量
@property(nonatomic,assign)NSInteger offset;


@end
@implementation viewThree

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        _offset = 0;
    }
    return self;
}

-(void)dealloc{
    [_timer invalidate];
}

- (void)createView{
    
     _gLayer = [CAGradientLayer new];
    _gLayer.frame = CGRectMake(20, 120, kScreenWidth-20, 300);
    _gLayer.colors = @[(id)[UIColor blueColor].CGColor,(id)[UIColor clearColor].CGColor];
    _gLayer.startPoint =  CGPointMake(0.5, 0);
    _gLayer.endPoint = CGPointMake(0.5, 1);
    
    _sLayer = [CAShapeLayer new];
    UIBezierPath *path = [UIBezierPath bezierPath];
    
//    [path addArcWithCenter:CGPointMake(120, 100) radius:95 startAngle:0 endAngle:M_PI/180 clockwise:YES];
    _sLayer.lineWidth = 5;
    _sLayer.strokeColor = [UIColor whiteColor].CGColor;
    _sLayer.fillColor = [UIColor clearColor].CGColor;
    _sLayer.path = path.CGPath;
    _gLayer.mask = _sLayer;
    [self.layer addSublayer:_gLayer];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    
}

-(void)timerAction:(NSTimer *)timer{
    
    _offset++;

    if(M_PI/180+_offset/18.0*M_PI - M_PI*2>= _offset/36.0*M_PI+M_PI/18.0){
        _offset = 0;
    }

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(120, 100) radius:95 startAngle:0+_offset/36.0*M_PI endAngle:M_PI/180+_offset/18.0*M_PI clockwise:YES];
    _sLayer.path = path.CGPath;
    
}

@end
