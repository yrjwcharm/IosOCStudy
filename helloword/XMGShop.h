//
//  XMGShop.h
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**数据模型*/
@interface XMGShop : NSObject
/**商品名称**/
@property(nonatomic,copy) NSString *name;
/**商品icon*/
@property(nonatomic,copy) NSString *icon;
- (instancetype) initWithIcon:(NSString *) icon  name:(NSString *) name;
+ (instancetype) shop:(NSString *) icon  name:(NSString *) name;
- (instancetype) initWithDic:(NSDictionary *)dic;
+ (instancetype) shopWithDic:(NSDictionary *) dic;

@end

NS_ASSUME_NONNULL_END
