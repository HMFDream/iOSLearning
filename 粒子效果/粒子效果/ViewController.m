//
//  ViewController.m
//  粒子效果
//
//  Created by 黄梦妃 on 15/12/3.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import "ViewController.h"
#import "CAEmitterLayerView.h"
#import "SnowView.h"
#import "RainView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *alphaView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    alphaView1.image        = [UIImage imageNamed:@"alpha"];
    
    UIImageView *alphaView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    alphaView2.image        = [UIImage imageNamed:@"alpha"];
    
    
    // 添加下雪效果
    CAEmitterLayerView *snowView = [[SnowView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    snowView.maskView            = alphaView1;
    [self.view addSubview:snowView];
    [snowView show];
    
    
    
    // 添加下雨效果
    CAEmitterLayerView *rainView = [[RainView alloc] initWithFrame:CGRectMake(100, 210, 100, 100)];
    rainView.maskView            = alphaView2;
    [self.view addSubview:rainView];
    [rainView show];
}



@end
