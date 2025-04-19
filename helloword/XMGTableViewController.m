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
 NSString *reuseId  =@"recycle"; //静态局部变量 特点 改变的是他的生命周期 ，不改变作用域规则 自始至终只分配一块内存空间 ，不改变作用域

- (void)viewDidLoad{
    [super viewDidLoad];
    //self.view//self.tableView
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //小技巧
//    self.tableView.tableFooterView = [[UIView alloc] init];
    //根据ID 这个标识 注册对应的CELL类型 为UITableViewCell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseId];
    self.tableView.rowHeight =100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 200;
}
//每当一个cell进入视野范围内就会调用一次
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 #pragma  -mark  当初用户【一开始】已经看到的cell 离开屏幕的cell------- 系统会自动把cell放到缓存池中
    //1、 去缓存池中取是否有可循环利用的Cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    //2.如果缓存池没有可循环利用的Cell,自己创建
//    if(cell==nil){
//        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
        //所有统一设置的Cell样式
//        cell.backgroundColor =[UIColor redColor];
//    }
    ;
    //3.设置数据
    //每一个CELL不一样的设置就统一放到外边 tips:有if就有else
    if(indexPath.row %2 ==0){
        cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    }else{
        cell.accessoryType =UITableViewCellAccessoryNone;
    } //有可能是从偶数行/奇数行循环利用过来的
    cell.textLabel.text =[NSString stringWithFormat:@"第%ld行数据",indexPath.row];
    NSLog(@"%p--%zd",cell,indexPath.row);

//#pragma mark - 离开屏幕被销毁掉 又重建一个CELL,CELL个数也是固定的  每次重新重建CELL,频繁创建或销毁。 创建过程 分配内存 是非常耗性能 性能会不好
//    UITableViewCell *cell1 =[[UITableViewCell alloc] init];
//    cell1.textLabel.text =[NSString stringWithFormat:@"第%ld行数据",indexPath.row];

    return cell;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
@end
