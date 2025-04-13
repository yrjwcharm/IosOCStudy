//
//  XMGCarGroup.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/4/13.
//

#import "XMGCarGroup.h"
#import "XMGCar.h"
@implementation XMGCarGroup

+ (instancetype)carWithDic:(NSDictionary *)dic{
    XMGCarGroup *carGroup = [[self alloc] init];
    //cars里边数据被转化成了字典
   //[carGroup setValuesForKeysWithDictionary:dic];
    carGroup.header = dic[@"header"];
    carGroup.footer =dic[@"footer"];
    NSMutableArray *tempArray =[NSMutableArray array];
    for (NSDictionary *carDic in dic[@"cars"]) {
        XMGCar *car = [XMGCar carWithDic:carDic];
        [tempArray addObject:car];
    }
    carGroup.cars = tempArray;
    return carGroup;
}

@end
