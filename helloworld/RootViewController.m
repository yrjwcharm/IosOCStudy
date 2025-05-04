//
//  MainViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "RootViewController.h"
#import "MJExtension.h"
#import "SecondViewController.h"
@interface RootViewController()
@end

@implementation RootViewController

//控制器一开始创建的时候，并不是透明的，只是它的背景颜色是透明的
- (void) viewDidLoad{
    [super viewDidLoad];
   
}
- (IBAction)btnSkipSecond:(id)sender {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}
@end
