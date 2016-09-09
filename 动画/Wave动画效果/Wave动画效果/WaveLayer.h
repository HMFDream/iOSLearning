//
//  WaveLayer.h
//  Wave动画效果
//
//  Created by 黄梦妃 on 16/9/8.
//  Copyright © 2016年 黄梦妃. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface WaveLayer : CAShapeLayer
@property(assign,nonatomic)CGFloat waveAmplitude;
@property(assign,nonatomic)CGFloat waveSpeed;
@property(assign,nonatomic)CGFloat waveHeight;
@property(assign,nonatomic)CGFloat waveWidth;
@property(strong,nonatomic)UIColor *waveColor;

- (void)createWave;
@end
