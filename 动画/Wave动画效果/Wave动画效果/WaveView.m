//
//  WaveView.m
//  Wave动画效果
//
//  Created by 黄梦妃 on 16/9/8.
//  Copyright © 2016年 黄梦妃. All rights reserved.
//

#import "WaveView.h"
#import "WaveLayer.h"

@interface WaveView()
@property(strong,nonatomic)WaveLayer *layer1;
@property(strong,nonatomic)WaveLayer *layer2;
@property(strong,nonatomic)WaveLayer *layer3;
@property(strong,nonatomic)CADisplayLink *displayLink;
@end

@implementation WaveView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initLayer];
    }
    return self;
}


- (void)initLayer{
    self.layer1 = [WaveLayer layer];
    self.layer2 = [WaveLayer layer];
    self.layer3 = [WaveLayer layer];
    
    self.layer1.waveAmplitude = 6;
    self.layer1.waveSpeed = 3;
    self.layer1.waveColor = [UIColor colorWithRed:0 green:0.7 blue:1 alpha:0.3];
    self.layer1.waveHeight = self.frame.size.height;
    self.layer1.waveWidth = self.frame.size.width;

    
    self.layer2.waveAmplitude = 4;
    self.layer2.waveSpeed = 6;
    self.layer2.waveColor = [UIColor colorWithRed:0 green:0.7 blue:1 alpha:0.2];
    self.layer2.waveHeight = self.frame.size.height;
    self.layer2.waveWidth = self.frame.size.width;
    
    self.layer3.waveAmplitude = 2;
    self.layer3.waveSpeed = 8;
    self.layer3.waveColor = [UIColor colorWithRed:0 green:0.7 blue:1 alpha:0.1];
    self.layer3.waveHeight = self.frame.size.height;
    self.layer3.waveWidth = self.frame.size.width;
    
    [self.layer1 createWave];
    [self.layer2 createWave];
    [self.layer3 createWave];
    
    [self.layer addSublayer:_layer1];
    [self.layer addSublayer:_layer2];
    [self.layer addSublayer:_layer3];
}

- (void)getWave{
    [self.layer1 createWave];
    [self.layer2 createWave];
    [self.layer3 createWave];
}

-(void)waveStop{
    [self.displayLink invalidate];
    self.displayLink = nil;
}

-(void)waveStart{
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getWave)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}



@end
