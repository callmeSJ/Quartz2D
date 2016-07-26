//
//  ViewController.m
//  AnimationForSJ
//
//  Created by SJ on 16/7/19.
//  Copyright © 2016年 SJ. All rights reserved.
//

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#import "ViewController.h"
#import "viewOne.h"
#import "viewTwo.h"
#import "viewThree.h"
#import "viewFour.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray<UIView *>*viewArray;
@property(nonatomic,strong)viewOne *viewOne;
@property(nonatomic,strong)viewTwo *viewTwo;
@property(nonatomic,strong)viewThree *viewThree;
@property(nonatomic,strong)viewFour *viewFour;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createViewOne];
    [self createViewTwo];
    [self createViewThree];
    [self createViewFour];
    _viewArray = @[_viewOne,_viewTwo,_viewThree,_viewFour];
    [self createButton];
    
}






-(void)createButton{
    NSArray *array = @[@"One",@"Two",@"Three",@"Four"];
    for(int i = 0; i <array.count ; i++){
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(-6, 450+40*i, 80, 30)];
        btn.tag = 100 + i;
        btn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        btn.titleLabel.textColor = [UIColor whiteColor];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(showView:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }

}

-(void)showView:(UIButton *)btn{
    for(int i = 0 ; i < _viewArray.count; i++){
        if(btn.tag - 100 == i){
            _viewArray[i].hidden = NO;
        }else{
            _viewArray[i].hidden = YES;
        }
    }

}

-(void)createViewOne{
    _viewOne = [[viewOne alloc]init];
    [self.view addSubview:_viewOne];
    [_viewOne createView];

}
-(void)createViewTwo{
    _viewTwo = [[viewTwo alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, 100)];
    [self.view addSubview:_viewTwo];
    _viewTwo.hidden = YES;
    [_viewTwo createView];
    
}
-(void)createViewThree{
    _viewThree = [[viewThree alloc]init];
    [self.view addSubview:_viewThree];
    _viewThree.hidden = YES;
    [_viewThree createView];
    
}

-(void)createViewFour{
    _viewFour = [[viewFour alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:_viewFour];
    _viewFour.hidden = YES;
    [_viewFour createView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
