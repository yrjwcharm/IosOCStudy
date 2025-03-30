//
//  ViewController.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"
#import "XMGShop.h"
@interface ViewController ()
@property(nonatomic,strong) NSArray *array;
@end

@implementation ViewController
- (NSArray *)array{
    if(_array==nil){
        NSString *path =[[NSBundle mainBundle] pathForResource:@"test.plist" ofType:nil];
        NSMutableArray *array =[NSMutableArray arrayWithContentsOfFile:path];
        NSMutableArray *tmpArray=[NSMutableArray array];
        for (NSDictionary *dic in self.array) {
//            XMGShop *shop = [[XMGShop alloc] initWithIcon:dic[@"icon"] name:dic[@"name"]];
//            XMGShop *shop = [XMGShop shop:dic[@"icon"] name:dic[@"name"]];
//            shop.name = dic[@"name"];
//            shop.icon =dic[@"icon"];
            XMGShop *shop =[[XMGShop alloc] initWithDic:dic];
            [tmpArray addObject:shop];
        }
        self.array =tmpArray;
    }
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)btnTest:(UIButton *)button {
    NSLog(@"测试%@",(self.array));
}
@end
