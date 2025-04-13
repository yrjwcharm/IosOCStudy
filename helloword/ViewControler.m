//
//  ViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"
#import "XMGCarGroup.h"
#import "XMGCar.h"
@interface ViewControler () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSArray *carGroups;
@end

@implementation ViewControler

- (NSArray *)carGroups{
    if(!_carGroups){
#pragma mark - plist中加载 死数据最好从plist管理
        //加载字典数据
        NSArray *array =[NSArray arrayWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"Cars" ofType:@"plist"]];
        NSMutableArray *tempArray =[NSMutableArray array];
        for (NSDictionary *carGroupDic in array) {
            XMGCarGroup *carGroup = [XMGCarGroup carWithDic:carGroupDic];
            [tempArray addObject:carGroup];
        }
        _carGroups = tempArray;
#pragma mark -模型实现
//        XMGCarGroup *group0 =[[XMGCarGroup alloc] init];
//        group0.header =@"德系品牌";
//        group0.footer =@"---德系品牌底部----";
//        group0.cars =@[
//            [XMGCar carWithName:@"宝马" icon:@"search.png"],
//        ];
//        XMGCarGroup *group1 =[[XMGCarGroup alloc] init];
//        group1.header =@"日系品牌";
//        group1.footer =@"---日系品牌底部----";
//        group1.cars =@[
//            [XMGCar carWithName:@"丰田" icon:@"scan.png"],
//            [XMGCar carWithName:@"丰田" icon:@"clock.png"],
//        ];
#pragma mark - 纯字典形式实现
//        _carGroups =@[
//            @{@"header":@"德系品牌",@"footer":@"I",@"cars":@[@{@"name":@"宝马",@"icon":@"search.png"}]},
//            @{@"header":@"日系品牌",@"footer":@"II",@"cars":@[
//                @{@"name":@"丰田",@"icon":@"scan.png"},
//                @{@"name":@"本田",@"icon":@"clock.png"}
//            ]}
//        ];
//        _carGroups=@[group0,group1];
    }
    return _carGroups;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
//    [self initTableViewPropety];
   
}
-(void) initTableViewPropety{
    //设置tableView每一行cell的高度
    self.tableView.rowHeight = 44;
    //设置tableView每一组Header的高度
    self.tableView.sectionHeaderHeight = 44;
    //设置tableView每一组Footer的高度
    self.tableView.sectionFooterHeight = 0;
    
    //设置分割线的颜色
    self.tableView.separatorColor =[UIColor clearColor];
    //设置分割线的样式
    self.tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    //整张表头部
    self.tableView.tableHeaderView =[[UISwitch alloc] init];
    //整张表底部
    self.tableView.tableFooterView=[[UISwitch alloc]init];
}
#pragma mark 不需要主动调用 在恰当的数据
//告诉TableView总共有多少组数据
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.carGroups.count;
}
//告诉TableView第Section组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    XMGCarGroup *carGroup = self.carGroups[section];
    return carGroup.cars.count;
}
//告诉TableView每一行显示的内容(tableView每一行都是UITableViewCell或者它的子类)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1  reuseIdentifier:@"cell"];
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    //    两者同时出现 accessoryView 优先级 大于 accessoryType
    //    cell.accessoryView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search.png"]];
    //blue gray default 一样 ios 7
    cell.selectionStyle =UITableViewCellSelectionStyleBlue;
#pragma  mark - backgroundView 优先级大于backgroundColor
//    cell.backgroundColor =[UIColor purpleColor];
    UIView *view =[[UIView alloc] init];
    view.backgroundColor=[UIColor blueColor];
    cell.backgroundView = view;
    
    #pragma  mark - 字典取值
    //    NSDictionary * carGroup = self.carGroups[indexPath.section];
    //    NSDictionary  *car =carGroup[@"cars"][indexPath.row];
    //    cell.textLabel.text=car[@"name"];
    //    cell.imageView.image=[UIImage imageNamed:car[@"icon"]];
    #pragma mark - 模型取值
    XMGCarGroup *carGroup = self.carGroups[indexPath.section];
    XMGCar *car = carGroup.cars[indexPath.row];
    #pragma mark -懒加载
    cell.textLabel.text=[NSString stringWithFormat:@"%@测试———————",car.name];
    cell.textLabel.textColor =[UIColor redColor];
    cell.detailTextLabel.text =[NSString stringWithFormat:@"%@",@"详细"];
    cell.imageView.image=[UIImage imageNamed:car.icon];
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    XMGCarGroup *carGroup = self.carGroups[section];
    return carGroup.header;
}
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//    XMGCarGroup *carGroup = self.carGroups[section];
//    return carGroup.footer;
//}



#pragma mark --------------------------------------------------UITableViewDelegate代理方法

//选中了某一行cell就会调用这个方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld----",indexPath.row);
}
//取消选中了某一行cell就会调用这个方法
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld--des",indexPath.row);
}
//返回每一组头部控件。只要设置了UITableView代理这个方法  titleForHeaderInSection
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIButton buttonWithType:UIButtonTypeContactAdd];
}
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    return
//}
//返回每一组的头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
//返回每一组的尾部高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
//返回每一行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

@end
