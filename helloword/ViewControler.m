//
//  ViewController.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"
@interface ViewController ()
@property(nonatomic,strong) NSArray *array;
@end

@implementation ViewController

/// 展示XIB
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //方式一:
//    UIView *carView = [[[NSBundle mainBundle] loadNibNamed:@"Car" owner:nil options:nil] firstObject];
    //方式二
    UINib *nib =[UINib nibWithNibName:@"Car" bundle:[NSBundle mainBundle]];
    UIView *carView =[[nib instantiateWithOwner:nil options:nil] lastObject];
    //不用设置Frame默认就会显示XibFrame,即使你设置了尺寸无效 ，但是背景颜色更改，后续AutoLayout才有用
//    carView.frame = CGRectMake(0, 40, self.view.frame.size.width, 150);
    [self.view addSubview:carView];

}
@end
