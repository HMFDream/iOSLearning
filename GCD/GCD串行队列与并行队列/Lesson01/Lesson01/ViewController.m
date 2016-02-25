//
//  ViewController.m
//  Lesson01
//
//  Created by 黄梦妃 on 16/2/25.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIImage *image;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //执行串行队列
//    [self serailQueue];
    //执行并行队列
//    [self initConcurrent];
    
    self.imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.imageView.center=self.view.center;
    [self.view addSubview:self.imageView];
    
    
    
    

    
   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
       
       NSString *netUrlString = @"http://pic.cnitblog.com/avatar/607542/20140226182241.png";
       NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:netUrlString]];
       NSData *picData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
       
       NSLog(@"处理业务逻辑");

       
       dispatch_async(dispatch_get_main_queue(), ^{
           self.imageView.image = [[UIImage alloc] initWithData:picData];
           
           NSLog(@"更新UI");
       });
   });
    
    
}

//串行队列
- (void)serailQueue
{
    //创建队列
    dispatch_queue_t dispatchQueue=dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL);
    
    //执行队列中的线程
    dispatch_async(dispatchQueue, ^{
        NSLog(@"1");
    });
    
    dispatch_async(dispatchQueue, ^{
        NSLog(@"2");
    });
    dispatch_async(dispatchQueue, ^{
        NSLog(@"3");
    });
    
    dispatch_async(dispatchQueue, ^{
        NSLog(@"4");
    });
    
    dispatch_async(dispatchQueue, ^{
        NSLog(@"5");
    });
    
    
}

//并发队列
- (void)initConcurrent
{
    //创建队列
    dispatch_queue_t dispatchQueue=dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT);
    
    //执行队列中的线程
    dispatch_async(dispatchQueue, ^{
        NSLog(@"1");
    });
    
    dispatch_async(dispatchQueue, ^{
        NSLog(@"2");
    });
    dispatch_async(dispatchQueue, ^{
        NSLog(@"3");
    });
    
    dispatch_async(dispatchQueue, ^{
        NSLog(@"4");
    });
    
    dispatch_async(dispatchQueue, ^{
        NSLog(@"5");
    });
}














@end
