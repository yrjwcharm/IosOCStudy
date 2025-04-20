//
//  ViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//
//不需要遵守协议、设置数据源
#import "ViewControler.h"
#import "XMGTgCell.h"
@interface ViewControler ()

@end

@implementation ViewControler
NSString *ID =@"cycler";
- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.rowHeight =70;
    //通过alloc initWithStyle创建的 永远不会加载XIB
//    [self.tableView registerClass:[XMGTgCell class] forCellReuseIdentifier:ID];
    //通过XIB
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XMGTgCell class]) bundle:nil] forCellReuseIdentifier:ID];
    //使用StoryBoard方式的话 不需要注册 他会给你的重用标识 如果没有找到的话 他会自动去Stoyrboard里边去找，但是storyboard里边必须设置重用标识
#pragma  mark -自定义分割线 更改约束不会有小数，直接更改透明度 
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XMGTgCell *cell =[tableView dequeueReusableCellWithIdentifier:ID];
    //传统方式的话 -----重用标识 必须 在XIB 属性列表里设置identifer:
    //自动注册 非必须
    return cell;
}
@end
