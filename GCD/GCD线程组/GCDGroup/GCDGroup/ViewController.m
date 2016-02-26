//
//  ViewController.m
//  GCDGroup
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
    
    //等待线程1与线程2执行完成之后再去执行线程3
    
    dispatch_group_t dispatchGroup=dispatch_group_create();
    
    
    //让线程1在group中执行
    dispatch_group_async(dispatchGroup,dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT), ^{
        sleep(1);
        NSLog(@"1");
    });
    
    //让线程2在group中执行
    dispatch_group_async(dispatchGroup,dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT), ^{
        sleep(3);
        NSLog(@"2");
    });
    
    
    //notify监听线程组是否执行完成，完成执行线程3
    //线程3
    dispatch_group_notify(dispatchGroup,dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT), ^{
        NSLog(@"3");
    });
    
}



@end
