//
//  XMGWineCell.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/5/1.
//

#import "XMGWineCell.h"
#import "XMGWine.h"
#import "XMGCircleButton.h"
@interface XMGWineCell()
//@property (weak, nonatomic) IBOutlet UIButton *btnDecrease;
//@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UIImageView *wineImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;
@property (weak, nonatomic) IBOutlet XMGCircleButton *btnMinus;
@property (weak, nonatomic) IBOutlet XMGCircleButton *btnPlus;

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
    self.priceLabel.text = [NSString stringWithFormat:@"¥%.0f",wine.price];
    self.buyCountLabel.text =[NSString stringWithFormat:@"%d",wine.buyCount];
    //根据count决定按钮是否可以点击
    self.btnMinus.enabled = self.wine.buyCount>0;
}
- (IBAction)btnPlus:(XMGCircleButton *)sender {
    self.btnMinus.enabled =YES;
    self.wine.buyCount++;
//    [self setWine:self.wine];
//    self.wine = self.wine;
    self.buyCountLabel.text =[NSString stringWithFormat:@"%d",self.wine.buyCount];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"plus" object:self userInfo:@{@"wine":self.wine}];
    if([self.delegate respondsToSelector:@selector(wineDidPlusClick:)]){
        [self.delegate wineDidPlusClick:self];
    }

}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (IBAction)btnMinus:(XMGCircleButton *)sender {
        self.wine.buyCount--;
        self.buyCountLabel.text =[NSString stringWithFormat:@"%d",self.wine.buyCount];
    if(self.wine.buyCount==0){
        self.btnMinus.enabled=NO;
    }
    //判断代理有没有实现这个方法
    if([self.delegate respondsToSelector:@selector(wineDidMinusClick:)]){
        [self.delegate wineDidMinusClick:self];
    }

//    [[NSNotificationCenter defaultCenter] postNotificationName:@"minus" object:self userInfo:@{@"wine":self.wine}];
}
@end
