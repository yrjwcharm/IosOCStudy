//
//  XMGWineCell.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/5/1.
//

#import "XMGWineCell.h"
#import "XMGWine.h"
@interface XMGWineCell()
//@property (weak, nonatomic) IBOutlet UIButton *btnDecrease;
//@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UIImageView *wineImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
@implementation XMGWineCell
//xib storyboard 加载完毕 会调用这个方法
- (void)awakeFromNib{
    [super awakeFromNib];
    //自定义button已经实现
//    [self setupCircleButton:self.btnAdd];
//    [self setupCircleButton:self.btnDecrease];
   
}
//-(void) setupCircleButton:(UIButton *) btn{
//    btn.layer.borderWidth=1.0;
//    btn.layer.borderColor =[UIColor orangeColor].CGColor;
//    btn.layer.cornerRadius=self.btnDecrease.frame.size.height *.5;
//}
- (void)setWine:(XMGWine *)wine{
    _wine =wine;
    self.wineImage.image=[UIImage imageNamed:wine.image];
    self.nameLabel.text=wine.name;
    self.priceLabel.text = [NSString stringWithFormat:@"%@",wine.price];
}
@end
