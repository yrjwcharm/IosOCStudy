//
//  XMGPageView.h
//  helloword
//
//  Created by 闫瑞锋 on 2025/4/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMGPageView : UIView
+(instancetype) pageView;
/**图片数据**/
@property(nonatomic,strong) NSArray *images;
@end

NS_ASSUME_NONNULL_END
