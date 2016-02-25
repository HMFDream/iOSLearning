//
//  ViewController.m
//  GCDDelay
//
//  Created by 黄梦妃 on 16/2/25.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"启动");
    
    //NSThread方式的延时操作
    [self performSelector:@selector(threadEvent:) withObject:self afterDelay:2.f];
    
    //取消延时执行操作
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    //GCD方式的延时执行操作
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@" GCD Event");
    });
    
    
}

- (void)threadEvent:(id)sender
{
    NSLog(@" NSThread Event");
}




@end
