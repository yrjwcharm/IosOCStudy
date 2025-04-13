//
//  XMGCarGroup.h
//  helloword
//
//  Created by 闫瑞锋 on 2025/4/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMGCarGroup : NSObject
/**头部**/
@property(nonatomic,copy) NSString *header;
/**底部**/
@property(nonatomic,copy) NSString *footer;
/**所有的车**/
@property(nonatomic,strong) NSArray *cars;
+(instancetype) carWithDic:(NSDictionary *) dic;
@end

NS_ASSUME_NONNULL_END
