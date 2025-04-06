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
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(strong,nonatomic) NSArray *array;
@property(weak,nonatomic) NSTimer *timer; //它已开始时候就可以一直工作，就说明有强指针一直引用着它，所以不会销毁 有人管理它的生命周期了
//若指针引用的对象，一旦被销毁 就自动会清空 为 nill
@end

@implementation ViewController
- (NSArray *)array {
    if (!_array) {
        // 在原始数组前后各加一个元素实现循环
        _array = @[@"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg", @"5.jpg"];
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate = self; // 确保设置代理
    
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    
    // 添加所有图片视图
    for (int i = 0; i < self.array.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.array[i]]];
        imageView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentSize = CGSizeMake(self.array.count * scrollViewW, 0);
    self.scrollView.pagingEnabled = YES;
    self.pageControl.numberOfPages = self.array.count;
    self.pageControl.enabled =NO;
    [self startTimer];
    
#pragma  mark - .m文件成员变量是私有的，你能直接给它赋值吗？  这里就要用到KVC强大之处  私有的公共的都可以赋值
    
//    self.pageControl.userInteractionEnabled = NO;
    if(self.array.count==1){
//        self.pageControl.hidden =YES;//UIView的方法 或者更改alpha值
//        self.pageControl.alpha=0;
        //单页的时候隐藏
        self.pageControl.hidesForSinglePage =YES;
    }
    // 设置内容尺寸为7页
}
//-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    if(decelerate==NO){
//    }
//}
//#pragma mark - 1、当scrollView减速完毕后，才变更指示器
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    //计算页码 偏移量的x/scrollView自己的宽度
//    int page = self.scrollView.contentOffset.x/scrollView.frame.size.width;
//    self.pageControl.currentPage = page;
//}
//#pragma mark - 2、当scrollView页面超过一半时，就变更指示器
-(void) scrollViewDidScroll:(UIScrollView *)scrollView{
    //四舍五入 int(小数+0.5)
        int page = self.scrollView.contentOffset.x/scrollView.frame.size.width+.5;
        self.pageControl.currentPage = page;
}
-(void)nextPage:(NSTimer *)timer{
    NSLog(@"获取传递的参数————————————%@",timer.userInfo);
    NSInteger page = self.pageControl.currentPage + 1;
    if(page==5){
        page =0;
    }
    [self.scrollView setContentOffset:CGPointMake(page*self.scrollView.frame.size.width, 0) animated:YES];
}
//当用户开始拖拽的时候，停止定时器
-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
    
}
-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self startTimer];
}
//线程 ----执行任务 程序已启动，系统会默认创建一条线程 这条线程就是主线程 作用: 首先显示刷新UI界面,处理与用户的交互事件
//主线程 同一时间只能处理一个任务
//多线程的原理： 1s------->一万个0.0001s 多个任务同时执行是个假象  CPU在多个任务之间来回快速调度造成一个假象
-(void) startTimer{
//    if(self.timer==nil){
        //返回一个自动执行的定时器对象 userInfo 就是给定时器执行的方法传递参数
        self.timer= [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage:) userInfo:@"123" repeats:YES];
    //修改timer在runLoop中的默认为NSRunLoopCommonModes模式 ，目的：不管主线程在做什么操作，都会分配一定时间处理定时器
        [[NSRunLoop mainRunLoop]  addTimer:self.timer forMode:NSRunLoopCommonModes];
//    }
}
-(void) stopTimer{
    [self.timer invalidate];
    self.timer = nil; //非必要
}
@end
