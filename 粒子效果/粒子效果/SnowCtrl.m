//
//  SnowCtrl.m
//  粒子效果
//
//  Created by 黄梦妃 on 15/12/3.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import "SnowCtrl.h"

@interface SnowCtrl ()

@end

@implementation SnowCtrl

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    // Configure the particle emitter to the top edge of the screen
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.0, -30);
    snowEmitter.emitterSize		= CGSizeMake(self.view.bounds.size.width * 2.0, 0.0);;
    
    // Spawn points for the flakes are within on the outline of the line
    snowEmitter.emitterMode		= kCAEmitterLayerOutline;
    snowEmitter.emitterShape	= kCAEmitterLayerLine;
    
    // Configure the snowflake emitter cell
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    
    snowflake.birthRate		= 1.0;
    snowflake.lifetime		= 120.0;
    
    snowflake.velocity		= -10;				// falling down slowly
    snowflake.velocityRange = 10;
    snowflake.yAcceleration = 2;
    snowflake.emissionRange = 0.5 * M_PI;		// some variation in angle
    snowflake.spinRange		= 0.25 * M_PI;		// slow spin
    
    snowflake.contents		= (id) [[UIImage imageNamed:@"DazFlake"] CGImage];
    snowflake.color			= [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    
    // Make the flakes seem inset in the background
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius  = 0.0;
    snowEmitter.shadowOffset  = CGSizeMake(0.0, 1.0);
    snowEmitter.shadowColor   = [[UIColor whiteColor] CGColor];
    
    // Add everything to our backing layer below the UIContol defined in the storyboard
    snowEmitter.emitterCells = [NSArray arrayWithObject:snowflake];
    [self.view.layer insertSublayer:snowEmitter atIndex:0];
}


- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIDeviceOrientationPortrait);
}
@end
