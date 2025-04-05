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
//当scrollview正在滚动的时候就会自动调用这个方法。
#pragma  mark -监听滚动 就得设置1.代理对象 2.遵守协议 3.实现scrollViewDidScroll方法
-(void) scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll------%s",__func__);
}
#pragma mark -即将开始拖拽
-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDragging------%s",__func__);
}
#pragma mark -即将停止拖拽
-(void) scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"scrollViewWillEndDragging------%s",__func__);
}
#pragma mark -已经停止拖拽
-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollViewDidEndDragging------%s",__func__);
}
#pragma  mark -scrollview减速完毕会调用，停止滚动
-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndDecelerating------%s",__func__);
}
//控制器View完全显示出来
-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear: animated];
}

@end
