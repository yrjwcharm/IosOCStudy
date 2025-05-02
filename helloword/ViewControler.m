//
//  MainViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"
#import "XMGWineCell.h"
#import "MJExtension.h"
#import "XMGWine.h"
@interface ViewControler () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *wineArray;
@end

@implementation ViewControler

- (NSMutableArray *)wineArray{
    if (_wineArray == nil) {
        _wineArray =[XMGWine mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _wineArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    XMGWineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[XMGWineCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.wine = self.wineArray[indexPath.row];
    return cell;
}
#pragma mark -添加数据
- (IBAction)add:(UIButton *)sender {
    XMGWine *win =[[XMGWine alloc] init];
    win.name =@"新品上市";
    win.image=@"head_course_icon.png";
    win.price = @30;
    [self.wineArray insertObject:win atIndex:0];
    //全局刷新
//    [self.tableView reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}
#pragma mark -更新数据
- (IBAction)update:(UIButton *)sender {
  XMGWine *wine=  self.wineArray[0];
    wine.price =@20;
    //全局刷新
//    [self.tableView reloadData];
    //局部刷新
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}
#pragma mark -删除数据

- (IBAction)delete:(UIButton *)sender {
    [self.wineArray removeObjectAtIndex:0];
    //全局刷新
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wineArray.count;
}
#pragma mark - UITableViewDelegate (滑动操作)
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1. 删除操作
    UIContextualAction *deleteAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"删除" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        // 从数据源中删除
        [self.wineArray removeObjectAtIndex:indexPath.row];
        // 删除表格行
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        completionHandler(YES);
    }];
    
    // 2. 置顶操作
    UIContextualAction *pinAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"置顶" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        // 将数据移动到数组首位
        NSString *pinnedItem = self.wineArray[indexPath.row];
        [self.wineArray removeObjectAtIndex:indexPath.row];
        [self.wineArray insertObject:pinnedItem atIndex:0];
        // 移动表格行
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.section];
        [tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];//底层逻辑已经包含了局部刷新功能
        completionHandler(YES);
//        self.tableView.editing =NO;
    }];
    // 3. 返回配置
    UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[deleteAction, pinAction]];
    config.performsFirstActionWithFullSwipe = NO; // 禁止完全滑动时自动执行第一个动作
    return config;
}

@end
