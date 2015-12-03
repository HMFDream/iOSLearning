//
//  CAEmitterLayerView.m
//  粒子效果
//
//  Created by 黄梦妃 on 15/12/3.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import "CAEmitterLayerView.h"

@interface CAEmitterLayerView ()

@end

@implementation CAEmitterLayerView

+(Class)layerClass
{
    return  [CAEmitterLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.emitterLayer=(CAEmitterLayer *)self.layer;
    }
    return self;
}

-(void)show
{

}

-(void)hide
{

}

@end
