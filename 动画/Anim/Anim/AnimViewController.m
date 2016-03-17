//
//  AnimViewController.m
//  Anim
//
//  Created by 黄梦妃 on 16/3/17.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "AnimViewController.h"

@interface AnimViewController ()
@property(strong,nonatomic)CALayer *layer;
@end

@implementation AnimViewController

/**
 *  CAAnimation
 
    1.基础动画：CABasicAnimation
    2.关键帧动画：CAKeyframeAnimation
    3.转场动画：CATransition
    4.动画组：CAAnimationGroup
 
 
 */




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(100, 100);
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    
    [self.view.layer addSublayer:layer];
    
    self.layer = layer;
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [self animationScale];
    [self keyAnimation];
}





/**
 *  关键帧动画
 */
-(void)keyAnimation
{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.duration = 2;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(100, 100, 200, 200));
    anim.path = path;
    
    //设置动画的执行节奏
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.layer addAnimation:anim forKey:nil];
    
}



/**
 *  基础动画
 */
-(void)animationScale
{

    //创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    //设置动画：keypath决定了执行怎样的动画
    //toVaule 到达哪个点 byVaule 增加多少值 fromVaule 从哪个点开始移动
    
    
    /**
     *  缩放
     */
//    anim.keyPath = @"bounds";
//    anim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 50, 50)];
    
    /**
     *  平移
     */
//    anim.keyPath = @"position";
//    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
//    anim.byValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
//    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
//    
    /**
     *  旋转
     */
    anim.keyPath = @"transform";
    anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 1, 1, 0)];
    
    
    
    anim.duration = 2;
    //动画执行完之后不删除动画
    anim.removedOnCompletion = NO;
    anim.fillMode = @"forwards";
    
    //添加动画
    [self.layer addAnimation:anim forKey:nil];
    
    
}



@end
