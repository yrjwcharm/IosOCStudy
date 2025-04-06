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
@end
