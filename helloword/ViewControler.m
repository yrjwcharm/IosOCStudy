//
//  ViewController.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"
#import "XMGButton.h"
@interface ViewController ()
@property(nonatomic,strong) NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    XMGButton *button = [XMGButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 80, self.view.bounds.size.width, 300);
    button.backgroundColor =[UIColor greenColor];
    [button setTitle:@"普通按钮" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"app_icon.png"] forState:UIControlStateNormal];
    //在按钮外边改的尺寸，内部都会覆盖
//    if (@available(iOS 15.0, *)) {
//        UIButtonConfiguration *config = [UIButtonConfiguration plainButtonConfiguration];
//        
//        // 图片配置
//        config.image = [UIImage systemImageNamed:@"cart"];
//        config.imagePadding = 10; // 图片与标题间距
//        config.imagePlacement = NSDirectionalRectEdgeTop; // 图片在上方
//        // 标题配置
//        config.title = @"Shop";
//        config.titleAlignment = UIButtonConfigurationTitleAlignmentCenter;
//        
//        button.configuration = config;
//    }
    [self.view addSubview:button];
}
@end
