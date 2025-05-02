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
@property (weak, nonatomic) IBOutlet UIButton *delButton;
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
    //告诉tabview在编辑模式下可以进行多选操作
    [self.tableView setAllowsMultipleSelectionDuringEditing:YES];
    [self.delButton setHidden:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    XMGWineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[XMGWineCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.tintColor = [UIColor redColor]; // 设置为红色
    }
    cell.wine = self.wineArray[indexPath.row];
    return cell;
}
#pragma mark -删除数据
- (IBAction)remove:(UIButton *)sender {
    //千万不要一边遍历，一边删除，因为每删除一个元素，其他元素的索引可能会发生变化
    NSMutableArray *array =[NSMutableArray array];
    for (int i =0; i<self.tableView.indexPathsForSelectedRows.count; i++) {
        [array addObject:self.wineArray[i]];
    }
    [self.wineArray removeObjectsInArray:array];
//    [self.tableView reloadData];
    [self.tableView deleteRowsAtIndexPaths:self.tableView.indexPathsForSelectedRows withRowAnimation:UITableViewRowAnimationAutomatic];

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
#pragma mark -批量删除数据--

- (IBAction)multiDelete:(UIButton *)sender {
//    self.tableView.editing =YES;
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    self.delButton.hidden = !self.tableView.editing;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wineArray.count;
}
#pragma mark - UITableViewDelegate (滑动操作)
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    //滑动菜单出现按钮操作时，table默认的编辑模式NO改成YES
//        self.tableView.editing =NO;
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
    }];
    // 3. 返回配置
    UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[deleteAction, pinAction]];
    config.performsFirstActionWithFullSwipe = NO; // 禁止完全滑动时自动执行第一个动作
    return config;
}

@end
