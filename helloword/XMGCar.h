//
//  XMGCar.h
//  helloword
//
//  Created by 闫瑞锋 on 2025/4/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//类比较特殊 就是这个类要引入其他类中 要遵守别人的代理 ----协议的话，就应该在.h文件中 自己当前类遵守-类扩展
@interface XMGCar : NSObject  <UIScrollViewDelegate>

@end

NS_ASSUME_NONNULL_END
