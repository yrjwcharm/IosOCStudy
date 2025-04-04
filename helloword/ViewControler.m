//
//  ViewController.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnForgetPwd;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   #pragma 代码创建 IOS 15 ,* 及以下都可以使用
//        UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
//        [button setTitle:@"测试" forState:UIControlStateNormal];
//        [button setImage:[UIImage imageNamed:@"gtui_search_bar_scan_icon.png"] forState:UIControlStateNormal];
//        button.backgroundColor =[UIColor greenColor];
//        button.frame =CGRectMake(80, 80, 200, 80);
//        button.contentEdgeInsets =UIEdgeInsetsMake(0, 70, 0, 0);
//        [self.view addSubview:button];
    #pragma toryboard/XIB 隐患  在 Interface Builder 中设置的属性可能自动转换为配置对象，导致旧代码失效。
    
//    self.btnForgetPwd.frame = CGRectMake(80, 80, 200, 80);
//    self.btnForgetPwd.contentEdgeInsets = UIEdgeInsetsMake(0,70,0,0);
#pragma IOS15 ,* 及以上 只要使用了 UIButtonConfiguration
// 以下代码不会生效（无编译错误，但实际无效） button.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 20);
//    UIButtonConfiguration *config = [self.btnForgetPwd configuration] ? : [UIButtonConfiguration plainButtonConfiguration];
//    config.title =@"测试111111";
//    config.image=[UIImage imageNamed:@"gtui_search_bar_scan_icon.png"];
//    config.contentInsets=NSDirectionalEdgeInsetsMake(0, 70, 0, 20);
//    [self.btnForgetPwd setConfiguration:config];
    // 完全迁移到新 API（推荐）
    if (@available(iOS 15.0, *)) {
        UIButtonConfiguration *config = [self.btnForgetPwd configuration] ? : [UIButtonConfiguration plainButtonConfiguration];
        config.contentInsets = NSDirectionalEdgeInsetsMake(0, 70, 0, 0); // 新方式
        self.btnForgetPwd.configuration = config;
    } else {
        self.btnForgetPwd.contentEdgeInsets = UIEdgeInsetsMake(0, 70, 0, 0); // 旧方式
    }
}

- (IBAction)button:(UIButton *)sender {
}
@end
