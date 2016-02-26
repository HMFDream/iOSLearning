//
//  ViewController.m
//  GCDSemaphore
//
//  Created by 黄梦妃 on 16/2/26.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //定义信号量
    dispatch_semaphore_t dispatchSemaphore=dispatch_semaphore_create(0);
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
        NSLog(@"1");
        sleep(1);
        //发送信号量
        dispatch_semaphore_signal(dispatchSemaphore);
    });
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
        
        //等待信号量
        dispatch_semaphore_wait(dispatchSemaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"2");
    });
    
    
}



@end
