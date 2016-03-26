//
//  ViewController.m
//  ReflectView
//
//  Created by 黄梦妃 on 16/3/26.
//  Copyright © 2016年 黄梦妃. All rights reserved.
//

#import "ViewController.h"
#import "ReflectView.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor blackColor];
    
    ReflectView *view = [[ReflectView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [view addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Group"]]];
    
    [self.view addSubview:view];
    
    [self addreplicateLayer];
   
    
}

- (void)addreplicateLayer
{
    CAReplicatorLayer *replicator  = [CAReplicatorLayer layer];
    replicator.frame = CGRectMake(100, 300, 100, 100);
    
    [self.view.layer addSublayer:replicator];
    
    replicator.instanceCount = 4;
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, M_PI_4, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 20, 0, 0);
    replicator.instanceTransform = transform;
    replicator.instanceRedOffset = -0.1;
    replicator.instanceAlphaOffset = -0.1;
    
    CALayer *layer = [CALayer layer];
    layer.frame = replicator.bounds;
    layer.backgroundColor = [UIColor redColor].CGColor;
    [replicator addSublayer:layer];
    
}




@end
