//
//  XMGButton.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/4/1.
//

#import "XMGButton.h"

@implementation XMGButton

- (instancetype)initWithFrame:(CGRect)frame{
    // 1. 调用父类初始化
       if (self = [super initWithFrame:frame]) {
           // 2. 确保父类初始化成功后，再执行子类配置
           self.titleLabel.textAlignment = NSTextAlignmentCenter;
           self.imageView.contentMode = UIViewContentModeScaleAspectFit;
       }
    return  self;
}
//方式一：
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 80, 120, 60);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(120, 20, 167, 167);
}
//方式二：
//- (void)layoutSubviews{
//    [super layoutSubviews];
//    self.titleLabel.frame = CGRectMake(0, 80, 120, 60);
//    self.imageView.frame = CGRectMake(120, 20, 167, 167);
//}

@end
