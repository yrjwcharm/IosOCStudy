//
//  ViewController.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//
#import "ViewControler.h"
#import "XMGCar.h"
/**
 验证是否是任何oc对象都可以作为ScrollView的代理
 苹果为什么把代理设置成weak 防止出现循环引用，导致内存泄漏
 代理监听控件的某些行为 代理
 */
@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(weak,nonatomic) UIImageView *imageView;
@property(nonatomic,strong) XMGCar *car;
@end

@implementation ViewController
//只是代表控制器View加载完毕
- (void)viewDidLoad {
    [super viewDidLoad];
    self.car =[[XMGCar alloc] init];
    //id类型 任何oc类型的对象 万物皆对象
    //通过代码创建的scrollView 一开始subviews这个数组为nill
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 80, 300, 200)];
    self.scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.scrollView];
    UIImage *image = [UIImage imageNamed:@"jieping.jpg"];
    UIImageView *imageVew =[[UIImageView alloc] initWithImage:image];
    [self.scrollView addSubview:imageVew];
    self.imageView = imageVew;
    self.scrollView.contentSize =image.size;
    self.scrollView.minimumZoomScale =0.5;
    self.scrollView.maximumZoomScale = 2.0;
//    self.scrollView.delegate = self;
    //可以通过storyboard拖拽设置代理
//    self.scrollView.delegate = self;
    //根据oc ARC法则 一旦对象创建出来那一刻若没有强指针引用它 就会被销毁掉
//    scrollView.delegate =self.car;
}
/**
 返回需要缩放的子控件（scrollView的子控件）
 */
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    NSLog(@"%@",self.imageView);
    return self.imageView;
}
- (IBAction)btnClick:(UIButton *)sender {
    NSLog(@"%@",self.imageView);
    self.imageView.frame =CGRectMake(0, 0, 20, 20);
}

@end
