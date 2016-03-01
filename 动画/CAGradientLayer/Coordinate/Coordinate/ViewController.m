//
//  ViewController.m
//  Coordinate
//
//  Created by 黄梦妃 on 16/2/29.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic)CAGradientLayer *gradientLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = CGRectMake(0, 0, 200, 200);
    self.gradientLayer.position = self.view.center;
    self.gradientLayer.borderWidth =1.f;
    [self.view.layer addSublayer:self.gradientLayer];
    
    self.gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                                  (__bridge id)[UIColor greenColor].CGColor,
                                  (__bridge id)[UIColor blueColor].CGColor];
    
    //设置颜色渐变方向
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint =CGPointMake(1, 1);
    
    //设置颜色分割点
    self.gradientLayer.locations = @[@(0.25),@(0.5),@(0.75)];
    
    [self performSelector:@selector(gradientLayerLocationAnimation) withObject:nil afterDelay:3.f];
    
}


- (void)gradientLayerLocationAnimation
{
    self.gradientLayer.locations = @[@(0.2),@(0.5),@(0.6)];
}


@end
