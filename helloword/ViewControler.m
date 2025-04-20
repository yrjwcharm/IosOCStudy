//
//  MainViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"
#import "XMGStatus.h"
#import "XMGStatusCell.h"
#import "MJExtension.h"
@interface ViewControler ()
@property(nonatomic,strong) NSArray *statuses;
@end

@implementation ViewControler
NSString *ID =@"status";
- (void)viewDidLoad{
    [self.tableView registerClass:[XMGStatusCell class] forCellReuseIdentifier:ID];
}

- (NSArray *)statuses{
    if(!_statuses){
        _statuses=[XMGStatus mj_objectArrayWithFilename:@"statuses.plist"];
        NSLog(@"%@",_statuses);
        if([_statuses isKindOfClass:[NSArray class]]){
        }
    }
    return _statuses;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statuses.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //访问缓存池
    XMGStatusCell *cell=  [tableView dequeueReusableCellWithIdentifier:ID];
    //传递模型数据
    cell.status = self.statuses[indexPath.row];
    return cell;
}
@end
