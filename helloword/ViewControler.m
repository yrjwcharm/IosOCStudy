//
//  ViewController.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIActivityIndicatorView *activityIndicator =[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
//    activityIndicator.center = CGPointMake(self.scrollView.bounds.size.width*.5, -40);
//    [activityIndicator startAnimating];
//    [self.scrollView addSubview:activityIndicator];
    UIImageView *imageView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jieping.jpg"]];
    [self.scrollView addSubview:imageView];
    self.scrollView.contentSize =imageView.bounds.size;
//    self.scrollView.showsVerticalScrollIndicator = NO;
//    self.scrollView.showsHorizontalScrollIndicator  = NO;

#pragma  注意点: 千万不要通过索引取 subviews数组 访问ScrollView子控件
//     UIView *view =[self.scrollView viewWithTag:1];
//    UIImageView *imgView = (UIImageView *)view;
//    if(imgView){
//        [imgView removeFromSuperview ];
//    }
    
    //禁止弹簧效果
//    self.scrollView.bounces = NO;
    //若不设置contentSize不能滚动，但是他总是有弹簧效果的用户希望下拉刷新，-----------------------------
//    self.scrollView.alwaysBounceVertical =YES;
//    self.scrollView.alwaysBounceHorizontal =YES;
}

@end
