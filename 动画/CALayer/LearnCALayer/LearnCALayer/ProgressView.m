//
//  ProgressView.m
//  LearnCALayer
//
//  Created by 黄梦妃 on 16/2/27.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "ProgressView.h"


@interface ProgressView ()
@property(strong,nonatomic)CALayer *progressLayer;
@property(assign,nonatomic)CGFloat currentViewWidth;
@end



@implementation ProgressView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.progressLayer=[CALayer layer];
        self.progressLayer.frame=CGRectMake(0, 0, 0, frame.size.height);
        self.progressLayer.backgroundColor=[UIColor redColor].CGColor;
        [self.layer addSublayer:self.progressLayer];
        self.currentViewWidth=frame.size.width;
    }
    return self;
}


@synthesize progress=_progress;

-(void)setProgress:(CGFloat)pro
{
    _progress=pro;
    if(pro<=0)
    {
        self.progressLayer.frame=CGRectMake(0, 0, 0, self.frame.size.height);
    }else if(pro<=1)
    {
         self.progressLayer.frame=CGRectMake(0, 0, self.currentViewWidth*pro, self.frame.size.height);
    }else
    {
        self.progressLayer.frame=CGRectMake(0, 0, self.currentViewWidth, self.frame.size.height);
    }
}

-(CGFloat)progress
{
    return _progress;
}



@end
