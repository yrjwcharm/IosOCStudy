//
//  ViewController.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"
@interface ViewController () <UIScrollViewDelegate>
@end

@implementation ViewController
//只是代表控制器View加载完毕
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //通过代码创建的scrollView 一开始subviews这个数组为nill
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 80, 300, 200)];
    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    UIImage *image = [UIImage imageNamed:@"jieping.jpg"];
    UIImageView *imageVew =[[UIImageView alloc] initWithImage:image];
    [scrollView addSubview:imageVew];
    scrollView.contentSize =image.size;
#pragma mark - 控制器成为的代理可以,但是得必须遵守协议 self(控制器对象) 必须在interface上遵守【 但是不要公开暴漏在.h文件里,要在.m类扩展上遵守】 遵守了协议,该控制器就拥有了这个协议下的方法声明,可以去实现implementation
    //scrollView代理属性
    scrollView.delegate = self;
    
}
-(void) scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
}
//控制器View完全显示出来
-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear: animated];
}

@end
