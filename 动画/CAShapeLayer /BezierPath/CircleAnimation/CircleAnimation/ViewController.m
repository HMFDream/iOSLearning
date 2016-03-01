//
//  ViewController.m
//  CircleAnimation
//
//  Created by 黄梦妃 on 16/2/29.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic)CAShapeLayer *shapeLayer;
@property(strong,nonatomic)NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = CGRectMake(0, 0, 200, 200);
    self.shapeLayer.position = self.view.center;
    
    UIBezierPath *circlePath =[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    
    
    self.shapeLayer.path = circlePath.CGPath;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    self.shapeLayer.lineWidth = 1.f;
    self.shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = 0.1;
   
    
    
    [self.view.layer addSublayer:self.shapeLayer];
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(circleAnimation) userInfo:nil repeats:YES];
    
    
    
}

- (void)circleAnimation
{
    self.shapeLayer.strokeEnd = arc4random() %100 /100.f;
}



@end
