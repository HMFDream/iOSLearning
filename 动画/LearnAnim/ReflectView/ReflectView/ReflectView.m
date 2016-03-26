//
//  ReflectView.m
//  ReflectView
//
//  Created by 黄梦妃 on 16/3/26.
//  Copyright © 2016年 黄梦妃. All rights reserved.
//

#import "ReflectView.h"

@implementation ReflectView

+(Class)layerClass
{
    return [CAReplicatorLayer class];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CAReplicatorLayer *replicatorlayer = (CAReplicatorLayer *)self.layer;
        replicatorlayer.instanceCount = 2;
        
        //move reflection instance below original and flip vertically
        CATransform3D transform = CATransform3DIdentity;
        CGFloat offsetY = self.bounds.size.height + 2;
        transform = CATransform3DTranslate(transform, 0, offsetY, 0);
        transform = CATransform3DScale(transform, 1, -1, 0);
        replicatorlayer.instanceTransform = transform;
        
        //reduce alpha of reflection layer
        replicatorlayer.instanceAlphaOffset = -0.6;
    }
    return self;
}

@end
