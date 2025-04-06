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
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(strong,nonatomic) NSArray *array;
@end

@implementation ViewController
- (NSArray *)array {
    if (!_array) {
        // 在原始数组前后各加一个元素实现循环
        _array = @[@"5.jpg", @"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg", @"5.jpg", @"1.jpg"];
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
    
    // 设置内容尺寸为7页
    self.scrollView.contentSize = CGSizeMake(scrollViewW * 7, 0);
    self.scrollView.pagingEnabled = YES;
    
    // 初始定位到第二页（索引1，显示原始第一张图）
    [self.scrollView setContentOffset:CGPointMake(scrollViewW * 1, 0)];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger currentPage = scrollView.contentOffset.x / pageWidth;
    
    // 当滚动到第一个克隆页时跳转到真实最后一个页
    if (currentPage == 0) {
        [scrollView setContentOffset:CGPointMake(pageWidth * 5, 0) animated:NO];
    }
    // 当滚动到最后一个克隆页时跳转到真实第一个页
    else if (currentPage == self.array.count - 1) {
        [scrollView setContentOffset:CGPointMake(pageWidth * 1, 0) animated:NO];
    }
}
@end
