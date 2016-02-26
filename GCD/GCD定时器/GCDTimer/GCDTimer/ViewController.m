//
//  ViewController.m
//  GCDTimer
//
//  Created by 黄梦妃 on 16/2/26.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong,nonatomic) dispatch_source_t dispatchSource;//为什么这个必须作为全局变量（作为局部变量运行失败）？
@property(strong,nonatomic)NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self runGCDTimer];
    
//    [self runTimer];
}


- (void)runGCDTimer
{
    //定义一个定时器
    self.dispatchSource=dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    
    
    dispatch_source_set_timer(self.dispatchSource, dispatch_time(DISPATCH_TIME_NOW, 0), NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(self.dispatchSource, ^{
        NSLog(@"GCD定时器");
        
    });
    
    dispatch_resume(self.dispatchSource);
}

- (void)runTimer
{
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerEvent) userInfo:nil repeats:YES];
}

-(void)timerEvent
{
    NSLog(@"timerEvent");
}

@end
