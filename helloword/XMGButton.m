//
//  XMGButton.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/4/1.
//

#import "XMGButton.h"

@implementation XMGButton

- (instancetype)initWithFrame:(CGRect)frame{
    if(self =[super initWithFrame: frame]){
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 80, 120, 60);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(120, 20, 167, 167);
}

@end
