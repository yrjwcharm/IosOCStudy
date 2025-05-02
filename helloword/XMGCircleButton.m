//
//  XMGCircleButton.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/5/2.
//

#import "XMGCircleButton.h"

@implementation XMGCircleButton

- (void)awakeFromNib{
    [super awakeFromNib];
    self.layer.borderWidth=1.0;
    self.layer.borderColor =[UIColor orangeColor].CGColor;
    self.layer.cornerRadius=self.frame.size.height *.5;
}

@end
