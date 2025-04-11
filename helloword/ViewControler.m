//
//  MainViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"

@interface MainViewControler ()
@end

@implementation MainViewControler

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //高度根据父控件----- 缩小多少比例 ，我红色控件就缩小多少比例
    UIView *redView =[[UIView alloc] init];
    redView.backgroundColor=[UIColor redColor];
    CGFloat x = self.view.frame.size.width-100;
    CGFloat y = self.view.frame.size.height-100;
    redView.frame = CGRectMake(x, y, 100, 100);
//    UIViewAutoresizingNone
//    UIViewAutoresizingFlexibleLeftMargin   //距离父控件的左边可以伸缩的 右边距离固定的
//    UIViewAutoresizingFlexibleWidth       //宽度会跟随父控件的宽度进行伸缩
//    UIViewAutoresizingFlexibleRightMargin //距离父控件的右边是可以伸缩的
//    UIViewAutoresizingFlexibleTopMargin   //距离父控件的顶部是可以伸缩的 底部距离是固定的
//    UIViewAutoresizingFlexibleHeight       //高度会跟随父控件的高度进行伸缩
//     //距离父控件的底部是可以伸缩的
    redView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:redView];
    
//    为什么会报错？
//    ​​结构体是值语义​​：当你调用 label.frame 时，你获取到的是 CGRect 结构体的一个​​临时副本​​，而不是指向原属性的指针。
//    ​​直接修改副本无效​​：即使你修改了这个临时副本的 origin.x，它也无法直接反映到真正的 label.frame 上。
//    ​​编译器会检测到这种错误​​：由于结构体临时副本的生存周期仅在表达式中有效，编译器会报错：「Expression is not assignable」（表达式不可赋值）。

//    UILabel *label =[[UILabel alloc] init];
//    label.frame = CGRectMake(40, 40, 100, 100);
//    //    label.frame.origin.x = 80;
//
//    CGRect rect =label.frame;
//    rect.origin.x =80;
//    label.frame = rect;
    

}
@end
