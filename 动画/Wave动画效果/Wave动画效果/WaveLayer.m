//
//  WaveLayer.m
//  Wave动画效果
//
//  Created by 黄梦妃 on 16/9/8.
//  Copyright © 2016年 黄梦妃. All rights reserved.
//

#import "WaveLayer.h"


@interface WaveLayer ()
@property(assign,nonatomic)CGFloat offsetX;
@end

@implementation WaveLayer

- (void)createWave{
    self.backgroundColor = [UIColor redColor].CGColor;
    self.offsetX += self.waveSpeed;
    self.fillColor = self.waveColor.CGColor;
    UIBezierPath *p = [UIBezierPath bezierPath];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, 0);
    CGFloat y = 0.0f;
    for (float x = 0.0f; x <= self.waveWidth ; x++) {
        y = self.waveAmplitude* sinf((x * M_PI / 180) - self.offsetX * M_PI / 180);
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil, self.waveWidth, self.waveHeight);
    CGPathAddLineToPoint(path, nil, 0,self.waveHeight);
    CGPathCloseSubpath(path);
    p.CGPath = path;
    CGPathRelease(path);
    self.path = p.CGPath;
}


@end
