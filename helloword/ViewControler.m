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
    UIView *shopCar = [[[NSBundle mainBundle] loadNibNamed:@"ShopCar" owner:nil options:nil] firstObject];
    shopCar.backgroundColor = [UIColor greenColor];
    NSLog(@"%f",shopCar.frame.size.width);
    //方式二
//    UINib *nib =[UINib nibWithNibName:@"Car" bundle:[NSBundle mainBundle]];
//    UIView *carView =[[nib instantiateWithOwner:nil options:nil] lastObject];
    //不用设置Frame默认就会显示XibFrame,即使你设置了尺寸无效 ，但是背景颜色更改，后续AutoLayout才有用
//    carView.frame = CGRectMake(0, 40, self.view.frame.size.width, 150);
    shopCar.frame = CGRectMake(0, 100, 80, 100);
    UIImageView *imageView = [shopCar viewWithTag:1];
    [imageView setImage:[UIImage imageNamed:@"1.png"]];
    imageView.contentMode =UIViewContentModeScaleAspectFit;
    UILabel *txtLabel = [shopCar viewWithTag:2];
    [txtLabel setText:@"测试"];
//    txtLabel.text =@"测试";
    [self.view addSubview:shopCar];

}
@end
