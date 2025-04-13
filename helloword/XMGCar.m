//
//  XMGCar.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/4/13.
//

#import "XMGCar.h"

@implementation XMGCar

+ (instancetype)carWithName:(NSString *)name icon:(NSString *)icon{
    XMGCar *car = [[self alloc] init];
    car.name =name;
    car.icon = icon;
    return car;
}
+ (instancetype)carWithDic:(NSDictionary *)dic{
    XMGCar *car =[[self alloc] init];
    car.name = dic[@"name"];
    car.icon = dic[@"icon"];
    return car;
}
@end
