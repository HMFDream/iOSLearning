//
//  ViewController.m
//  BezierPath
//
//  Created by 黄梦妃 on 16/2/29.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建椭圆贝塞尔曲线
    UIBezierPath *oval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 100)];
    
    //创建椭圆贝塞尔曲线
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    
    //创建矩形贝塞尔曲线
    UIBezierPath *rect = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 200, 100)];
    
    //创建shapeLayer,CAShapeLayer的frame与贝塞尔不影响
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.frame = CGRectMake(0, 0, 200, 100);
    shape.position = self.view.center;
    shape.borderWidth = 1.f;
    
    //修改贝塞尔曲线的填充颜色
    shape.fillColor = [UIColor redColor].CGColor;
    
    //建立贝塞尔曲线与CAShapeLayer之间的关联
    shape.path = circle.CGPath;
    
    //添加并显示
    [self.view.layer addSublayer:shape];
    
}


@end
