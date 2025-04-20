//
//  XMGStatus.h
//  helloword
//
//  Created by 闫瑞锋 on 2025/4/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMGStatus : NSObject
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *text;
@property(nonatomic,assign,getter=isVip) BOOL vip;
@property(nonatomic,copy) NSString *picture;
@end

NS_ASSUME_NONNULL_END
