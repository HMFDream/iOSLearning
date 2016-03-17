//
//  WheelView.m
//  Anim
//
//  Created by 黄梦妃 on 16/3/17.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "WheelView.h"
#import "CCButton.h"

@interface WheelView ()
@property (weak, nonatomic) IBOutlet UIImageView *centerView;
@property (weak, nonatomic) IBOutlet UIButton *centerBtn;
@property(strong,nonatomic)UIButton *selectedButton;
@property(strong,nonatomic)CADisplayLink *link;
@end




@implementation WheelView
- (IBAction)chooseNumber:(UIButton *)sender {
    [self stopAnimation];
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.toValue = @(2 * M_PI * 3);
    anim.duration = 2;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.delegate = self;
    [self.centerView.layer addAnimation:anim forKey:nil];
    self.userInteractionEnabled = NO;
}


-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    self.userInteractionEnabled = YES;
    //选中的视图置顶居中
    self.centerView.transform = CGAffineTransformMakeRotation(-(self.selectedButton.tag * M_PI / 6));
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startAnimation];//1秒之后开始旋转
    });
}




+(instancetype)wheelView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil] lastObject];
}

-(void)awakeFromNib
{
    self.centerView.userInteractionEnabled = YES;
    
    UIImage *image = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *imageSelected = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    
    //求取像素大小
    CGFloat smallW = image.size.width / 12.0 * [UIScreen mainScreen].scale;
    CGFloat smallH = image.size.height * [UIScreen mainScreen].scale;
    
    //添加按钮
    for (int i=0; i<12; i++) {
        CCButton *btn = [CCButton buttonWithType:UIButtonTypeCustom];
        CGRect smallRect = CGRectMake(i*smallW, 0, smallW, smallH);
        
        //裁剪图片
        CGImageRef samllImage = CGImageCreateWithImageInRect(image.CGImage, smallRect);
        //正常状态下的图片
        [btn setImage:[UIImage imageWithCGImage:samllImage] forState:UIControlStateNormal];
        
        //选中状态下的图片
        CGImageRef smallSelected = CGImageCreateWithImageInRect(imageSelected.CGImage, smallRect);
        [btn setImage:[UIImage imageWithCGImage:smallSelected] forState:UIControlStateSelected];
        //背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        btn.bounds = CGRectMake(0, 0, 68, 143);
      
        //设置定位点和位置
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.layer.position = self.center;

        //设置旋转角度（绕着锚点进行旋转）
        CGFloat angle = (30*i)/180.0*M_PI;
        btn.transform = CGAffineTransformMakeRotation(angle);
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.centerView addSubview:btn];
        
        if(i == 0)
        {
            [self btnClick:btn];
        }
    }
    
}

-(void)btnClick:(CCButton *)btn
{
    self.selectedButton.selected = NO;
    btn.selected = YES;
    self.selectedButton = btn;
}



-(void)startAnimation
{

    if(self.link)
    {
        return;
    }
    //一秒刷新60次
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    self.link = link;
}


-(void)update
{
    self.centerView.transform = CGAffineTransformRotate(self.centerView.transform, M_PI/100);
}


-(void)stopAnimation
{
    [self.link invalidate];
    //安全起见，无效时设置为nil；
    self.link = nil;
}









@end
