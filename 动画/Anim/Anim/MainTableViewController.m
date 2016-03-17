//
//  MainTableViewController.m
//  Anim
//
//  Created by 黄梦妃 on 16/3/17.
//  Copyright (c) 2016年 黄梦妃. All rights reserved.
//

#import "MainTableViewController.h"
#import "CALayerViewController.h"
#import "AnimViewController.h"
#import "ExchangeViewController.h"


@interface MainTableViewController ()
@property(strong,nonatomic)NSArray *titleArr;
@property(strong,nonatomic)NSArray *viewCtrlArr;
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"动画示例";
    self.titleArr = @[@"CALayer",@"CAAnimation",@"exchange"];
    self.viewCtrlArr = @[
                         [CALayerViewController new],
                         [AnimViewController new],
                         [ExchangeViewController new]
                         ];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.titleArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text = self.titleArr[indexPath.row];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.navigationController pushViewController:self.viewCtrlArr[indexPath.row] animated:YES];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}







@end
