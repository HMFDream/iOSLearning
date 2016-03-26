//
//  MainTableViewController.m
//  LearnCALayer_01
//
//  Created by 黄梦妃 on 16/3/25.
//  Copyright © 2016年 黄梦妃. All rights reserved.
//

#import "MainTableViewController.h"
#import "ViewController.h"

@interface MainTableViewController ()
@property(strong,nonatomic)NSArray *arr;
@property(strong,nonatomic)NSArray *darr;
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"LearnCALayer_01";
    self.arr = @[@"contents属性  寄宿图"];
    self.darr = @[@"UIImage有一个CGImage属性，它返回一个CGImageRef"];
    

}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arr.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
    }
    
    cell.textLabel.text = self.arr[indexPath.row];
    cell.detailTextLabel.text = self.darr[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViewController *c = [[ViewController alloc]initWithStyle:LayerContents];
    
    [self.navigationController pushViewController:c animated:YES];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}






@end
