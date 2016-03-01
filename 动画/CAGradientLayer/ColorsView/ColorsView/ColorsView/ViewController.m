//
//  ViewController.m
//  ColorsView
//
//  Created by 黄梦妃 on 16/2/29.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic)CAGradientLayer *gradientLayer;//渐变层
@property(strong,nonatomic)NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg"]];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    
    
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = imageView.frame;
    [self.view.layer addSublayer:self.gradientLayer];
    
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(0, 1);
    
    self.gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                  (__bridge id)[UIColor redColor].CGColor];
    
    
    //设定颜色分割点
    self.gradientLayer.locations = @[@(0.5f),@(1.f)];
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(timerEvent) userInfo:nil repeats:YES];
    
    
}

- (void)timerEvent
{
    //设定颜色组动画
    self.gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                  (__bridge id)[UIColor colorWithRed:arc4random() % 255 /255.f green:arc4random() % 255 /255.f blue:arc4random() % 255 /255.f alpha:1].CGColor];
    
    
    self.gradientLayer.locations = @[@(arc4random() % 10 / 10.f),@(1.f)];
    
}



@end
