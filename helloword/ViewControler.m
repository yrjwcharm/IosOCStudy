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
@property (nonatomic, strong) NSMutableArray *wineArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
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
    self.tableView.rowHeight = 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"wine";
    //使用StoryBoard的话 不用注册与判断 但是必须在Storyboard中设置重用标识
    XMGWineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
@end
