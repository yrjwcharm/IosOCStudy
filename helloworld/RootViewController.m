//
//  MainViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "RootViewController.h"
#import "MJExtension.h"
@interface RootViewController()
@end

@implementation RootViewController

//控制器一开始创建的时候，并不是透明的，只是它的背景颜色是透明的
- (void) viewDidLoad{
    [super viewDidLoad];
   
}
- (IBAction)btnSkipSecond:(id)sender {
   [self.navigationController pushViewController:[NSClassFromString(@"SecondViewController") new] animated:YES];
}
- (IBAction)btnSecond:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SecondStoryboard" bundle:nil];

    // 通过 Storyboard ID 实例化控制器
    UIViewController *newVC = [storyboard instantiateInitialViewController];

    // 或通过导航控制器 Push（需嵌入 UINavigationController）
    [self.navigationController pushViewController:newVC animated:YES];
}
@end
