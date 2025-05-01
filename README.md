# tableView 添加/更新/删除数据

**最靠谱的方法是 改变模型数据**

```objc
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
    [self.tableView reloadData];
    
}
#pragma mark -更新数据
- (IBAction)update:(UIButton *)sender {
  XMGWine *wine=  [self.wineArray firstObject];
    wine.name =@"你滚蛋吧";
    wine.image =@"default_loading_error.png";
    wine.price =@20;
}
#pragma mark -删除数据

- (IBAction)delete:(UIButton *)sender {
    [self.wineArray removeObjectAtIndex:0];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wineArray.count;
}
@end

```

