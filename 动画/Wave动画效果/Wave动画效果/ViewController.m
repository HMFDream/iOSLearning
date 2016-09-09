//
//  ViewController.m
//  Wave动画效果
//
//  Created by 黄梦妃 on 16/9/8.
//  Copyright © 2016年 黄梦妃. All rights reserved.
//

#import "ViewController.h"
#import "WaveView.h"
@interface ViewController ()
@property(strong,nonatomic)WaveView *waveView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.waveView = [[WaveView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 400)];
    [self.view addSubview:self.waveView];
}

- (IBAction)startWave:(UIButton *)sender {
    [self.waveView waveStart];
}

- (IBAction)stopWave:(id)sender {
    [self.waveView waveStop];
}



@end
