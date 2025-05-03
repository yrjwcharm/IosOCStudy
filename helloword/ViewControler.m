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
#import "XMGCircleButton.h"
@interface ViewControler () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *wineArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *btnBuy;
@end

@implementation ViewControler
double totalPrice =0;
- (NSMutableArray *)wineArray{
    if (_wineArray == nil) {
        _wineArray =[XMGWine mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _wineArray;
}
#pragma mark -控制器View加载完毕
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 80;
    //监听通知
    NSNotificationCenter *center =  [NSNotificationCenter defaultCenter] ;
    [center addObserver:self selector:@selector(plusClick:) name:@"plus" object:nil];
    [center addObserver:self selector:@selector(minusClick:) name:@"minus" object:nil];
//    访问了一块已经被系统回收的内存空间，会出现野指针错误
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"wine";
    //首先从缓存池里边去取，如果缓存池里边没有/也没有注册，他就会从storyboard里边找是否有重用标识 ，就会加载cell绑定标识
    //使用StoryBoard的话 不用注册与判断 但是必须在Storyboard中设置重用标识
    XMGWineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.wine =self.wineArray[indexPath.row];
    //通过模型去修改cell的内容
    return cell;
}

-(void) plusClick:(NSNotification *) note{
    XMGWine *wine = note.userInfo[@"wine"];
    totalPrice += wine.price;
    self.totalPriceLabel.text=[NSString stringWithFormat:@"¥%.0f",totalPrice];
    self.btnBuy.enabled =YES;
}
-(void) minusClick:(NSNotification *) note{
    XMGWine *wine = note.userInfo[@"wine"];
    totalPrice -= wine.price;
    self.totalPriceLabel.text=[NSString stringWithFormat:@"¥%.0f",totalPrice];
    self.btnBuy.enabled= totalPrice>0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wineArray.count;
}
- (IBAction)btnBuy:(UIButton *)sender {
}
- (IBAction)btnClear:(UIButton *)sender {
    self.totalPriceLabel.text =@"¥0";
    for(int i =0;i<self.wineArray.count;i++){
        XMGWine *wine = self.wineArray[i];
        wine.buyCount =0;
    }
    [self.tableView reloadData];
}
@end
