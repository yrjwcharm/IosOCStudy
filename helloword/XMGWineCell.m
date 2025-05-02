//
//  XMGWineCell.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/5/1.
//

#import "XMGWineCell.h"
#import "XMGWine.h"
@interface XMGWineCell()
@property(weak,nonatomic) UIImageView *checkedImageView;
@end
@implementation XMGWineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //缓存里去不到 调用，一次性设置
    if(self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UIImageView *imageView =[[UIImageView alloc] init];
        imageView.hidden =YES;
        imageView.image=[UIImage imageNamed:@"home_tab_my_super_high_fragment_sel"];
        [self.contentView addSubview:imageView];
        self.checkedImageView = imageView;
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat WH = 24;
    CGFloat x = self.contentView.frame.size.width - WH-10;
    CGFloat y = (self.contentView.frame.size.height-WH)*0.5;
    self.checkedImageView.frame =CGRectMake(x, y, WH, WH);
}

- (void)setWine:(XMGWine *)wine{
    _wine = wine;
    self.imageView.image = [UIImage imageNamed:wine.image];
    self.textLabel.text = wine.name;
    NSLog(@"%@",wine.price);
    self.detailTextLabel.text = [NSString stringWithFormat:@"%@",wine.price];
    if(wine.isChecked){
        self.checkedImageView.hidden =NO;
    }else{
        self.checkedImageView.hidden =YES;
    }
}

@end
