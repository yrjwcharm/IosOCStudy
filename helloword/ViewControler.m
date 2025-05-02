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
@property(nonatomic,strong) NSMutableArray *selectedIndexPath;
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
    self.selectedIndexPath=[NSMutableArray array];
    //告诉tabview在编辑模式下可以进行多选操作
    [self.tableView setAllowsMultipleSelectionDuringEditing:YES];
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wineArray.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XMGWine *wine = self.wineArray[indexPath.row];
    if(wine.isChecked){
        wine.checked =NO;
        [self.selectedIndexPath removeObject:indexPath];
    }else{
        wine.checked =YES;
        [self.selectedIndexPath addObject:indexPath];
    }
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (IBAction)remove:(id)sender {
    NSMutableArray *tempArray =[NSMutableArray array];
    for (NSIndexPath *indexPath in self.selectedIndexPath) {
        [tempArray addObject:self.wineArray[indexPath.row]];
        
    }
    [self.wineArray removeObjectsInArray:tempArray];
    
    [self.tableView deleteRowsAtIndexPaths:self.selectedIndexPath withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.selectedIndexPath removeAllObjects];
}
@end
