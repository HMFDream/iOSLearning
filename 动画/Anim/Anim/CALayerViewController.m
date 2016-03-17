//
//  CALayerViewController.m
//  Anim
//
//  Created by 黄梦妃 on 16/3/17.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "CALayerViewController.h"





@interface CALayerViewController ()

@end

@implementation CALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
//    [self initImageView];
    [self initMyLayer];
}


//layer的一些用途
-(void)initImageView
{
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Group"]];
    
    imgView.frame = CGRectMake(100, 100, 200, 200);
    
    
    [self.view addSubview:imgView];
    
    //设置阴影颜色,偏移量,透明度
    imgView.layer.shadowColor = [UIColor yellowColor].CGColor;

    imgView.layer.shadowOffset = CGSizeMake(10, 10);
    
    imgView.layer.shadowOpacity = 0.5;
    
    imgView.layer.cornerRadius = 10;
    
    //强制内部所有子层支持圆角效果，不设置这个，UIImageView是不会有圆角效果的。设置之后没有阴影效果。
    imgView.layer.masksToBounds = YES;
    
    //边框颜色和粗细
    imgView.layer.borderColor = [UIColor redColor].CGColor;
    imgView.layer.borderWidth = 1;
    
    //图层旋转、缩放,两个同时写以后一个为主
    
    imgView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1);
    imgView.layer.transform = CATransform3DMakeRotation(M_PI_2, 0, 0, 1);
    
    
}

//自定义layer1
-(void)initMyLayer
{
    CALayer *layer = [CALayer layer];
    
    layer.backgroundColor = [UIColor redColor].CGColor;
    
    layer.bounds = CGRectMake(100, 300, 100, 100);
    
    //position决定layer在父图层中的位置，以父图层左上角为原点（0，0）
    //anchorPoint锚点（定位点）决定layer的那个点在position所指的位置，以自己左上角为原点，默认值（0.5，0.5），x、y取值是0-1，右下角（1，1）
    
    layer.position = CGPointMake(200, 200);
    
    layer.anchorPoint = CGPointMake(0.5, 0.5);
    
    layer.contents = (__bridge id)([UIImage imageNamed:@"Group"].CGImage);
    
    [self.view.layer addSublayer:layer];
    
    
}





@end
