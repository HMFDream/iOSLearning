//
//  ViewController.h
//  LearnCALayer_01
//
//  Created by 黄梦妃 on 16/3/25.
//  Copyright © 2016年 黄梦妃. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,LayerStyle){
    LayerContents
    
};

@interface ViewController : UIViewController

- (instancetype)initWithStyle:(LayerStyle)layerStyle;

@end
