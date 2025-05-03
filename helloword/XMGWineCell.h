//
//  XMGWineCell.h
//  helloword
//
//  Created by 闫瑞锋 on 2025/5/1.
//

#import <UIKit/UIKit.h>
@class XMGWine,XMGWineCell;
NS_ASSUME_NONNULL_BEGIN
@protocol XMGWineCellDelegate <NSObject>
@optional
-(void) wineDidPlusClick:(XMGWineCell *)cell;
-(void) wineDidMinusClick:(XMGWineCell *)cell;

@end
@interface XMGWineCell : UITableViewCell
@property (nonatomic, strong) XMGWine *wine;
//代理是weak id 不需要指针符号
@property(nonatomic,weak) id <XMGWineCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
