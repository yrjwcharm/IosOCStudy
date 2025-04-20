//
//  ViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//
//不需要遵守协议、设置数据源
#import "ViewControler.h"@interface ViewControler ()

@end

@implementation ViewControler
NSString *ID =@"cycler";
- (void)viewDidLoad{
    [super viewDidLoad];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:ID];
    return cell;
}
@end
