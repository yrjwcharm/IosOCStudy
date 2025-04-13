//
//  XMGCar.h
//  helloword
//
//  Created by 闫瑞锋 on 2025/4/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMGCar : NSObject
/**车名 */
@property(copy,nonatomic) NSString *name;
/**icon**/
@property(copy,nonatomic) NSString *icon;

+(instancetype) carWithName:(NSString *)name icon:(NSString *)icon;
+(instancetype) carWithDic:(NSDictionary *) dic;
@end

NS_ASSUME_NONNULL_END
