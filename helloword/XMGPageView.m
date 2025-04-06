//
//  XMGPageView.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/4/6.
//

#import "XMGPageView.h"
@interface XMGPageView()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@end
@implementation XMGPageView

-(instancetype) initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        
    }
    return self;
}
//Xib加载完毕会调用这个方法 一些初始化的代码可以放在这里
-(void)awakeFromNib{
    
}
-(void) layoutSubviews{
    [super layoutSubviews];
}
+(instancetype)pageView {
//    @"XMGPageView" 把当前的类名转化成字符串
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
- (void)setImages:(NSArray *)images{
    _images = images;
    //1. 根据图片名称创建ImageView添加到ScrollView
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    
    // 添加所有图片视图
    for (int i = 0; i < images.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:images[i]]];
        imageView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.pagingEnabled =YES;
    self.scrollView.contentSize = CGSizeMake(images.count * scrollViewW, 0);
}
@end
