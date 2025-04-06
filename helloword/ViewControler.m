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
        NSArray *originalArray = @[@"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg", @"5.jpg"];
        NSMutableArray *tempArray = [NSMutableArray array];
        [tempArray addObject:originalArray.lastObject];
        [tempArray addObjectsFromArray:originalArray];
        [tempArray addObject:originalArray.firstObject];
        _array = [tempArray copy];
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    
    for (int i = 0; i < self.array.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.array[i]]];
        imageView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
        [self.scrollView addSubview:imageView];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.array.count * scrollViewW, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.scrollView setContentOffset:CGPointMake(scrollViewW, 0)];
    
    self.pageControl.numberOfPages = self.array.count - 2;
    self.pageControl.hidesForSinglePage = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat scrollViewW = scrollView.frame.size.width;
    CGFloat offsetX = scrollView.contentOffset.x;
    
    if (offsetX <= 0) {
        [scrollView setContentOffset:CGPointMake(scrollViewW * (self.array.count - 2), 0) animated:NO];
    }
    
    if (offsetX >= scrollViewW * (self.array.count - 1)) {
        [scrollView setContentOffset:CGPointMake(scrollViewW, 0) animated:NO];
    }
    
    int page = (int)(scrollView.contentOffset.x / scrollViewW + 0.5) - 1;
    self.pageControl.currentPage = page;
}

@end
