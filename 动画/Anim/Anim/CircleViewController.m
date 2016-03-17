//
//  CircleViewController.m
//  Anim
//
//  Created by 黄梦妃 on 16/3/17.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "CircleViewController.h"
#import "WheelView.h"

@interface CircleViewController ()
@property(strong,nonatomic)WheelView *wheelView;
@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    WheelView *wheel = [WheelView wheelView];
    
    
    
//    wheel.frame = CGRectMake(0, 0, 300, 300);
    wheel.center = self.view.center;
    NSLog(@"%f",self.view.center.x);
    NSLog(@"%f",self.view.center.y);

    NSLog(@"%f",wheel.center.x);
    NSLog(@"%f",wheel.center.y);

    
    [self.view addSubview:wheel];
    
    self.wheelView = wheel;
    
//    [wheel startAnimation];
    
    
    
    
}


@end
