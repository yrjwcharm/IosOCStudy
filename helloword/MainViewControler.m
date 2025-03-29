//
//  MainViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "MainViewControler.h"

@interface MainViewControler ()
@end

@implementation MainViewControler

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIButtonTypeCustom = 0,                         // no button type
//    UIButtonTypeSystem API_AVAILABLE(ios(7.0)),  // standard system button
//
//    UIButtonTypeDetailDisclosure,
//    UIButtonTypeInfoLight,
//    UIButtonTypeInfoDark,
//    UIButtonTypeContactAdd,
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(40 ,  40, 357, 300);
//    btn.titleLabel.text =@"去死吧";
//    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"普通按钮" forState: UIControlStateNormal];
    [btn setTitle:@"高亮按钮" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted ];
    [btn setTitleShadowColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [btn setTitleShadowColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    btn.titleLabel.shadowOffset=CGSizeMake(-1, -2);
    [btn setImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateHighlighted];
//    [btn setTitleShadowOffset:CGSizeMake(-1, -2)];
//    btn.imageView.backgroundColor=[UIColor greenColor];
    [btn setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"3.png"] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [btn addTarget:self action:@selector(<#selector#>) forControlEvents:<#(UIControlEvents)#>]
    [self.view addSubview:btn];
    
}
- (IBAction)btnClick:(id)sender {
    // 1. 检查 sender 是否为 UIButton 类型
       if ([sender isKindOfClass:[UIButton class]]) {
           // 2. 安全类型转换
           UIButton *button = (UIButton *)sender;
           button.enabled = NO; // 禁用按钮
       } else {
           // 非 UIButton 类型时的处理（如打印警告）
           NSLog(@"警告：sender 不是 UIButton 类型，实际类型：%@", [sender class]);
       }
   
}
@end
