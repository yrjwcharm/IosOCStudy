//
//  XMGStatus.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/4/20.
//

#import "XMGStatus.h"

@implementation XMGStatus
- (NSString *)description {
    return [NSString stringWithFormat:@"XMGStatus: icon=%@, text=%@,picture=%@,vip=%d,name=%@", self.icon, self.text,self.picture,self.isVip,self.name];
}
@end
