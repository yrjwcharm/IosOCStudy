//
//  XMGCar.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/4/5.
//

#import "XMGCar.h"
@interface XMGCar()
    
@end
@implementation XMGCar

-(void) scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%s---scrollViewDidScroll",__func__);
}
//当一个对象被销毁之前会调用这个方法
-(void) dealloc{
    NSLog(@"%s-----对象即将被销毁....",__func__);
}

@end
