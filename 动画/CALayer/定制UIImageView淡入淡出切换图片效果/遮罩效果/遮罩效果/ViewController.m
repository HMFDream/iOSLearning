//
//  ViewController.m
//  遮罩效果
//
//  Created by 黄梦妃 on 16/2/28.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong,nonatomic)CALayer *imageLayer;
@property(strong,nonatomic)CALayer *maskLayer;


@property(strong,nonatomic)UIImage *imageContents;
@property(strong,nonatomic)UIImage *maskContents;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor=[UIColor redColor];
    
    self.imageContents = [UIImage imageNamed:@"原始图片"];
    self.maskContents =[UIImage imageNamed:@"maskLayerContents"];
    
    //创建图片Layer
    self.imageLayer = [CALayer layer];
    self.imageLayer.frame = CGRectMake(0, 0, 200, 200);
    self.imageLayer.contents = (__bridge id)(self.imageContents.CGImage);
    [self.view.layer addSublayer:self.imageLayer];
    
    //创建遮罩layer
    self.maskLayer = [CALayer layer];
    self.maskLayer.frame = self.imageLayer.bounds;
    self.maskLayer.contents = (__bridge id)(self.maskContents.CGImage);

    //设置图片层的遮罩层,边缘的颜色随着背景颜色的变化而变化
    self.imageLayer.mask = self.maskLayer;
    
    [self performSelector:@selector(maskLayerAnimation) withObject:nil afterDelay:3.f];
    
}

- (void)maskLayerAnimation
{
    self.imageLayer.frame = CGRectMake(50, 50,200, 200);
}



@end
