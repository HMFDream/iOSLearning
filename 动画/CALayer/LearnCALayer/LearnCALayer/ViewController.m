//
//  ViewController.m
//  LearnCALayer
//
//  Created by 黄梦妃 on 16/2/27.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//





//layer相当于PS中图层的概念


#import "ViewController.h"
#import "ProgressView.h"

@interface ViewController ()
@property(nonatomic,strong)CALayer *layer;
@property(strong,nonatomic)ProgressView *progressView;
@property(strong,nonatomic)NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //创建一个容器view
//    UIView *containerView=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 3)];
//    containerView.backgroundColor=[UIColor redColor];
//    [self.view addSubview:containerView];
    
    //更改view的layer
//    containerView.layer.frame=CGRectMake(0, 0, 200, 200);
//    containerView.layer.backgroundColor=[UIColor greenColor].CGColor;

    //创建一个独立的layer,可以触发隐式动画
//    self.layer=[CALayer layer];
//    self.layer.frame=CGRectMake(0, 0, 20, 3);
//    self.layer.backgroundColor=[UIColor greenColor].CGColor;
//    
//    [containerView.layer addSublayer:self.layer];
    
    self.progressView=[[ProgressView alloc]initWithFrame:CGRectMake(20, 20, 290, 3)];
    self.progressView.layer.borderWidth=1;
    [self.view addSubview:self.progressView];
    
    
    [self performSelector:@selector(layerAnimation) withObject:nil afterDelay:3.f];
    
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(layerAnimation) userInfo:nil repeats:YES];
}


-(void)layerAnimation
{
    
//    self.layer.frame=CGRectMake(0, 0, 100, 3);
    

    self.progressView.progress=arc4random()%100/100.0;
    
}



@end
