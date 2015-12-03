//
//  SnowView.m
//  粒子效果
//
//  Created by 黄梦妃 on 15/12/3.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import "SnowView.h"

@implementation SnowView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    self.emitterLayer.masksToBounds=YES;
    //发射体形状
    self.emitterLayer.emitterShape=kCAEmitterLayerLine;
    //发射模式
    self.emitterLayer.emitterMode     = kCAEmitterLayerSurface;
    //发射体的尺寸
    self.emitterLayer.emitterSize     = self.frame.size;
    //发射点
    self.emitterLayer.emitterPosition = CGPointMake(self.bounds.size.width / 2.f, - 20);
}


- (void)show {
    CAEmitterCell *snowflake  = [CAEmitterCell emitterCell];
    //粒子生产率，每秒创建的个数
    snowflake.birthRate       = 1.f;
    //层的速率
    snowflake.speed           = 10.f;
    //速度值
    snowflake.velocity        = 2.f;
    //速度的微调值
    snowflake.velocityRange   = 10.f;
    //y轴加速度
    snowflake.yAcceleration   = 10.f;
    //发射角度
    snowflake.emissionRange   = 0.5 * M_PI;
    //旋转范围
    snowflake.spinRange       = 0.25 * M_PI;
    //设置图片
    snowflake.contents        = (__bridge id)([UIImage imageNamed:@"snow"].CGImage);
    //设置颜色
    snowflake.color           = [UIColor redColor].CGColor;
    //生命周期
    snowflake.lifetime        = 60.f;
    //比例因子
    snowflake.scale           = 0.5;
    snowflake.scaleRange      = 0.3;
    
    // 添加动画
    self.emitterLayer.emitterCells = @[snowflake];
}

@end
