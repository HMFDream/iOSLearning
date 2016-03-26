//
//  ViewController.m
//  LearnCALayer_01
//
//  Created by 黄梦妃 on 16/3/25.
//  Copyright © 2016年 黄梦妃. All rights reserved.
//

#import "ViewController.h"





@interface ViewController ()
@property(assign,nonatomic)LayerStyle layerStyle;
@property(strong,nonatomic)CALayer *layer;

@end

@implementation ViewController



- (instancetype)initWithStyle:(LayerStyle)layerStyle
{
    self = [super init];
    if (self) {
        switch (_layerStyle) {
            case LayerContents:
                [self initViewWithLayerContents];
                break;
                
            default:
                break;
        }
    }
    return self;
}


/**
 *  设置contents属性
 */
-(void)initViewWithLayerContents
{
    
    _layer = [CALayer layer];
    
    _layer.frame = CGRectMake(100, 100, 100, 100);
    
    _layer.backgroundColor = [UIColor blueColor].CGColor;
    
    //设置寄宿图
    _layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"Group"].CGImage);
    
    //决定内容在图层的边界中怎么对齐,类似于UIImageView的contentMode属性
    _layer.contentsGravity=kCAGravityResizeAspect;
    
    [self.view.layer addSublayer:_layer];
    
}









- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
}


@end
