//
//  XMGShop.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/30.
//

#import "XMGShop.h"

@implementation XMGShop
/**对象方法**/
- (instancetype)initWithIcon:(NSString *)icon name:(NSString *)name{
    self.name = name;
    self.icon = icon;
    return self;
}
- (instancetype) initWithDic:(NSDictionary *)dic{
    self.name = dic[@"name"];
    self.icon = dic[@"icon"];
    return self;
}
+ (instancetype)shopWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}
/**类方法**/
+ (instancetype)shop:(NSString *)icon name:(NSString *)name{
    return [[self alloc] initWithIcon:icon name:name];
}
@end
