//
//  ViewController.m
//  ChangeImage
//
//  Created by 黄梦妃 on 16/2/28.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong,nonatomic)CALayer *imageLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIImage *image1=[UIImage imageNamed:@"起始图片"];
    
    
//    self.view.layer.contents=(__bridge id)(image.CGImage);

    self.imageLayer=[CALayer layer];
    self.imageLayer.frame=CGRectMake(0, 0, 302, 707);
    
    [self.view.layer addSublayer:self.imageLayer];
    
    
    self.imageLayer.contents=(__bridge id)(image1.CGImage);
    
    
    [self performSelector:@selector(layerAnimation) withObject:nil afterDelay:3.f];
    
}


- (void)layerAnimation
{
    UIImage *image2=[UIImage imageNamed:@"结束图片"];
    
    //图片动画
    CABasicAnimation *contentAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
    contentAnimation.fromValue = self.imageLayer.contents;
    contentAnimation.toValue = (__bridge id)(image2.CGImage);
    contentAnimation.duration=3.f;
    
    //bounds动画
    CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnimation.fromValue = [NSValue valueWithCGRect:self.imageLayer.bounds];
    boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 302/2.f, 707/2.f)];
    boundsAnimation.duration=3.f;
    
    //组合动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[contentAnimation,boundsAnimation];
    groupAnimation.duration=3.f;
    
    //设定layer动画结束之后的值（必须设定，否则会恢复到动画之前的状态）
    self.imageLayer.contents=(__bridge id)(image2.CGImage);
    self.imageLayer.bounds = CGRectMake(0, 0, 302/2.f, 707/2.f);
    
    
    //提交动画
    [self.imageLayer addAnimation:groupAnimation forKey:nil];
}


@end
