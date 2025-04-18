//
//  XMGTableViewController.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/4/18.
//

#import "XMGTableViewController.h"

@interface XMGTableViewController ()

@end

@implementation XMGTableViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text=@"1234";
    return cell;
}
@end
