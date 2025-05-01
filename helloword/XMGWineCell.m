//
//  XMGWineCell.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/5/1.
//

#import "XMGWineCell.h"
#import "XMGWine.h"
@implementation XMGWineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setWine:(XMGWine *)wine{
    _wine = wine;
    self.imageView.image = [UIImage imageNamed:wine.image];
    self.textLabel.text = wine.name;
    NSLog(@"%@",wine.price);
    self.detailTextLabel.text = [NSString stringWithFormat:@"%@",wine.price];
}
@end
