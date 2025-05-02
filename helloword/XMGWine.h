//
//  XMGWine.h
//  helloword
//
//  Created by 闫瑞锋 on 2025/5/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMGWine : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) double  price;
@property (nonatomic, copy) NSString *image;
//@property(nonatomic,assign,getter=isChecked) BOOL checked;
@property(nonatomic,assign) int buyCount;
@end

NS_ASSUME_NONNULL_END
