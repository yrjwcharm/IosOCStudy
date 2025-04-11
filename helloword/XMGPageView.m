//
//  XMGPageView.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/4/6.
//

#import "XMGPageView.h"
@interface XMGPageView() <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property(weak,nonatomic) NSTimer *timer;
@end
@implementation XMGPageView

-(instancetype) initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        
    }
    return self;
}
//Xib加载完毕会调用这个方法 一些初始化的代码可以放在这里 只加载一次
-(void)awakeFromNib{
    [super awakeFromNib];
    //设置总页数
    self.pageControl.hidesForSinglePage =YES;
    self.scrollView.delegate = self;
    [self startTimer];
}
//当一个控件frame发生变化的时候 她就会调用这个方法 调整尺寸和位置
-(void) layoutSubviews{
    [super layoutSubviews];
}
+(instancetype)pageView {
//    @"XMGPageView" 把当前的类名转化成字符串
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
- (void)setImages:(NSArray *)images{
    _images = images;
    self.pageControl.numberOfPages = images.count;
    //1. 根据图片名称创建ImageView添加到ScrollView
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    
    #pragma mark -//移除之前添加的 //这个逻辑是有问题的 影响开发原则 要保证数组数量是不变的
//    for(UIImageView *imageView in self.scrollView.subviews){
//        [imageView removeFromSuperview];
//    }
    #pragma mark-让subviews这个数组每个对象都执行 removeFromSuperview方法
    [self.scrollView.subviews  makeObjectsPerformSelector:@selector(removeFromSuperview)];
    // 添加所有图片视图
    for (int i = 0; i < images.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:images[i]]];
        imageView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.pagingEnabled =YES;
    self.scrollView.contentSize = CGSizeMake(images.count * scrollViewW, 0);
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopTimer];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self startTimer];
}
-(void) startTimer{
    self.timer =[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
-(void) stopTimer{
    [self.timer invalidate];
}
-(void) scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = self.scrollView.contentOffset.x/scrollView.frame.size.width +.5;
    self.pageControl.currentPage = page;
}
-(void)nextPage{
    NSInteger page = self.pageControl.currentPage + 1;
    if(page==_images.count){
        page =0;
    }
    [self.scrollView setContentOffset:CGPointMake(page * self.scrollView.frame.size.width, 0) animated:YES];
}
@end
