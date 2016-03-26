//
//  ViewController.m
//  ButtonAngle
//
//  Created by 黄梦妃 on 16/3/26.
//  Copyright © 2016年 黄梦妃. All rights reserved.
//


/**
 *  按钮设定圆角可以不同，比如三个圆角一个直角，利用CAShapeLayer
 */



#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnAngle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //The rectangle that defines the basic shape of the path.
    CGRect rect = [self.btnAngle bounds];
    
    //The radius of each corner oval.
    CGSize radii = CGSizeMake(10,10);
    
    //A bitmask value that identifies the corners that you want rounded.
    UIRectCorner corners = UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft;
    
    //Creates and returns a new UIBezierPath object initialized with a rounded rectangular path.
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    shapeLayer.lineWidth = 2;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    
    [self.btnAngle.layer addSublayer:shapeLayer];
    


    
}



@end
