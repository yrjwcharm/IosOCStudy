//
//  ViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//
//不需要遵守协议、设置数据源
#import "ViewControler.h"
#import "XMGTableViewCell.h"
@interface ViewControler ()
@end

@implementation ViewControler
NSString *ID =@"cycler";
- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
    self.tableView.sectionIndexColor=[UIColor redColor];
    self.tableView.sectionIndexBackgroundColor=[UIColor orangeColor];
    [self.tableView registerClass:[XMGTableViewCell class] forCellReuseIdentifier:ID];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 7;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XMGTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if(indexPath.section==0){
        if(indexPath.row==0){
            cell.textLabel.text=[NSString stringWithFormat:@"爱情"];
        }
    }else if(indexPath.section==1){
        if(indexPath.row==0){
            cell.textLabel.text=[NSString stringWithFormat:@"宝贝"];
        }
    }else if(indexPath.section==2){
        if(indexPath.row==0){
            cell.textLabel.text=[NSString stringWithFormat:@"车场"];
        }
    }else if(indexPath.section==3){
        if(indexPath.row==0){
            cell.textLabel.text=[NSString stringWithFormat:@"定档"];
        }
    }else if(indexPath.section==4){
        if(indexPath.row==0){
            cell.textLabel.text=[NSString stringWithFormat:@"饿了吗"];
        }
    }else if(indexPath.section==5){
        if(indexPath.row==0){
            cell.textLabel.text=[NSString stringWithFormat:@"辅助"];
        }
    }else {
        if(indexPath.row==0){
            cell.textLabel.text=[NSString stringWithFormat:@"供给"];
        }
    }
    return cell;
}
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return @[@"A",@"B",@"C",@"D",@"E",@"F",@"G"];
}
@end
