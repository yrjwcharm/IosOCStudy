//
//  ViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"

@interface ViewControler () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSArray *carGroups;
@end

@implementation ViewControler

- (NSArray *)carGroups{
    if(!_carGroups){
        _carGroups =@[
            @{@"header":@"德系品牌",@"footer":@"I",@"cars":@[@{@"name":@"宝马",@"icon":@"search.png"}]},
            @{@"header":@"日系品牌",@"footer":@"II",@"cars":@[
                @{@"name":@"丰田",@"icon":@"scan.png"},
                @{@"name":@"本田",@"icon":@"clock.png"}
            ]}
        ];
    }
    return _carGroups;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
}
#pragma mark 不需要主动调用 在恰当的数据
//告诉TableView总共有多少组数据
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.carGroups.count;
}
//告诉TableView第Section组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = self.carGroups[section][@"cars"];
    return array.count;
}
//告诉TableView每一行显示的内容(tableView每一行都是UITableViewCell或者它的子类)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[[UITableViewCell alloc] init];
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
//    两者同时出现 accessoryView 优先级 大于 accessoryType 
//    cell.accessoryView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search.png"]];
    NSDictionary * carGroup = self.carGroups[indexPath.section];
    NSDictionary  *car =carGroup[@"cars"][indexPath.row];
    cell.textLabel.text=car[@"name"];
    cell.imageView.image=[UIImage imageNamed:car[@"icon"]];
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.carGroups[section][@"header"];
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return self.carGroups[section][@"footer"];
}
@end
