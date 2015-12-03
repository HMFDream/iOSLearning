//
//  CAEmitterLayerView.h
//  粒子效果
//
//  Created by 黄梦妃 on 15/12/3.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAEmitterLayerView : UIView
@property(strong,nonatomic)CAEmitterLayer *emitterLayer;

-(void)show;

-(void)hide;
@end
