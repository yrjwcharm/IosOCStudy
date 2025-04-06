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
}
@end
