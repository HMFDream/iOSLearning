//
//  CCButton.m
//  Anim
//
//  Created by 黄梦妃 on 16/3/17.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "CCButton.h"

@implementation CCButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 40;
    CGFloat imageH = 47;
    CGFloat imageX = (contentRect.size.width - imageW)*0.5;
    CGFloat imageY = 20;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

@end
