//
//  ExchangeViewController.m
//  Anim
//
//  Created by 黄梦妃 on 16/3/17.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

/**
 *  CAAnimation
 
 1.基础动画：CABasicAnimation
 2.关键帧动画：CAKeyframeAnimation
 3.转场动画：CATransition
 4.动画组：CAAnimationGroup
 
 
 kCATransitionFade   交叉淡化过渡
 kCATransitionMoveIn 新视图移到旧视图上面
 kCATransitionPush   新视图把旧视图推出去
 kCATransitionReveal 将旧视图移开,显示下面的新视图
 
 2.用字符串表示
 pageCurl            向上翻一页
 pageUnCurl          向下翻一页
 rippleEffect        滴水效果
 suckEffect          收缩效果，如一块布被抽走
 cube                立方体效果
 oglFlip             上下翻转效果
 
 *
 */



#import "ExchangeViewController.h"

@interface ExchangeViewController ()
@property(strong,nonatomic)UIButton *btnExchange;
@property(strong,nonatomic)UIButton *btnPush;

@property(strong,nonatomic)CALayer *layer;
@property(strong,nonatomic)UIView *animView;

@end

@implementation ExchangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initButtonAndView];
    
}

-(void)initButtonAndView
{
    //    self.btnExchange = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 50, 30)];
    //    [self.btnExchange setTitle:@"fade" forState:UIControlStateNormal];
    //    [self.btnExchange setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    [self.btnExchange addTarget:self action:@selector(exchangeView) forControlEvents:UIControlEventTouchUpInside];
    //
    //    [self.view addSubview:self.btnExchange];
    //
    //
    //    self.btnPush = [[UIButton alloc]initWithFrame:CGRectMake(60, 100, 50, 30)];
    //    [self.btnPush setTitle:@"MoveIn" forState:UIControlStateNormal];
    //    [self.btnPush setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    [self.btnPush addTarget:self action:@selector(pushView) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:self.btnPush];
    
    NSArray* titleArr = @[
                          @"Fade",
                          @"MoveIn",
                          @"Push",
                          @"Reveal",
                          @"pageCurl",
                          @"pageUnCurl",
                          @"rippleEffect",
                          @"suckEffect",
                          @"cube",
                          @"oglFlip"
                          ];
    
    for (int i = 0; i < 5; i++) {
        UIButton* btn1 =
        [[UIButton alloc] initWithFrame:CGRectMake(0 + i * 70, 100, 50, 30)];
        [btn1 setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn1 setTag:i + 1000];
        [btn1 addTarget:self
                 action:@selector(exchangeView:)
       forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn1];
    }
    
    for (int i = 5; i < 10; i++) {
        UIButton* btn1 =
        [[UIButton alloc] initWithFrame:CGRectMake((i - 5) * 70, 150, 50, 30)];
        [btn1 setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn1 setTag:i + 1000];
        [btn1 addTarget:self
                 action:@selector(exchangeView:)
       forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn1];
        
    }
    
    
    
    self.animView = [[UIView alloc]initWithFrame:CGRectMake(0, 200, 300, 300)];
    //    self.animView.backgroundColor = [UIColor redColor];
    
    UIView *v1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    v1.backgroundColor = [UIColor blueColor];
    [self.animView addSubview:v1];
    
    
    UIView *v2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    v2.backgroundColor = [UIColor grayColor];
    [self.animView addSubview:v2];
    
    [self.view addSubview:self.animView];
    
}



/**
 *  交换视图
 */
-(void)exchangeView:(UIButton *)button
{
    CATransition* transition = [CATransition animation];
    transition.duration = 1.f;
    
    //设置动画的执行节奏
    transition.timingFunction =
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    //部分私有api官方审核不通过
    switch (button.tag) {
        case 1000:
            transition.type = kCATransitionFade;
            break;
        case 1001:
            transition.type = kCATransitionMoveIn;
            break;
        case 1002:
            transition.type = kCATransitionPush;
            break;
        case 1003:
            transition.type = kCATransitionReveal;
            break;
        case 1004:
            transition.type = @"pageCurl";
            break;
        case 1005:
            transition.type = @"pageUnCurl";
            break;
        case 1006:
            transition.type = @"rippleEffect";
            break;
        case 1007:
            transition.type = @"suckEffect";
            break;
        case 1008:
            transition.type = @"cube";
            break;
        case 1009:
            transition.type = @"oglFlip";
            break;
        default:
            break;
    }
    
    transition.subtype = kCATransitionFromRight;
    
    [self.animView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [self.animView.layer addAnimation:transition forKey:@"exchange"];
    
    
    
    
}

-(void)pushView
{
    CATransition* transition = [CATransition animation];
    transition.duration = 1.f;
    
    //设置动画的执行节奏
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    //部分私有api官方审核不通过
    transition.type = @"cube";
    transition.subtype = kCATransitionFromRight;
    
    [self.animView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [self.animView.layer addAnimation:transition forKey:@"push"];
    
    //如果想切换视图控制器时产生动画,给导航的视图layer添加动画
    //    [self.navigationController.view.layer addAnimation:transition forKey:@"aaf"];
    
}


@end
