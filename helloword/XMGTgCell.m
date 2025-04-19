//
//  XMGTableViewCell.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/4/19.
//

#import "XMGTgCell.h"

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

@interface XMGTgCell()
@property(nonatomic,weak) UIImageView *iconImageView;
@property(nonatomic,weak) UILabel *titleLabel;
@property(nonatomic,weak) UILabel *priceLabel;
@property(nonatomic,weak) UILabel *buyCountLabel;

@end
@implementation XMGTgCell

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        CGFloat space = 10;
        //父控件可能没有尺寸
        UIImageView *iconImageView = [[UIImageView alloc] init];
        iconImageView.backgroundColor =[UIColor redColor];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        [iconImageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(space);
            make.left.equalTo(space);
            make.bottom.equalTo(-space);
            make.width.equalTo(80);
        }];
        UILabel *titleLabel =[[UILabel alloc]init];
        titleLabel.text=@"烤鱼";
        titleLabel.backgroundColor =[UIColor blueColor];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        [titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top .equalTo(iconImageView.top);
            make.left .equalTo(iconImageView.right).offset(space);
            make.right.equalTo(self.contentView).offset(-space);
            make.height.equalTo(20);
        }];
        UILabel *priceLabel =[[UILabel alloc]init];
        priceLabel.text=@"¥30";
        priceLabel.backgroundColor =[UIColor greenColor];
        [self.contentView addSubview:priceLabel];
        [priceLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left .equalTo(titleLabel.left);
            make.bottom.equalTo(iconImageView.bottom);
            make.size.equalTo(CGSizeMake(100, 15));
        }];
        self.priceLabel =priceLabel;
        UILabel *buyCountLabel =[[UILabel alloc]init];
        buyCountLabel.backgroundColor=[UIColor orangeColor];
        buyCountLabel.text=@"30人已购买";
        buyCountLabel.textAlignment= NSTextAlignmentRight;
        [self.contentView addSubview:buyCountLabel];
        self.buyCountLabel = buyCountLabel;
        [buyCountLabel makeConstraints:^(MASConstraintMaker *make) {
            make.bottom .equalTo(priceLabel.bottom);
            make.right.equalTo(self.titleLabel);
            make.size.equalTo(CGSizeMake(150, 14));
        }];
    }
    return self;
}
#pragma mark - Frame确定位置和尺寸
//- (void)layoutSubviews{
//    [super layoutSubviews];
//    CGFloat space = 10;
//    CGFloat iconX =10;
//    CGFloat iconY =10 ;
//    CGFloat iconW =80;
//    CGFloat iconH =self.contentView.frame.size.height-20 ;
//    self.iconImageView.frame=CGRectMake(iconX, iconY, iconW, iconH);
//    CGFloat titleX =iconX + iconW +space;
//    CGFloat titleY =10;
//    CGFloat titleW =self.contentView.frame.size.width-titleX - 10;
//    CGFloat titleH =20 ;
//    self.titleLabel.frame=CGRectMake(titleX, titleY, titleW, titleH);
//    CGFloat priceX =iconX + iconW +space;
//    CGFloat priceY =self.contentView.frame.size.height-30;
//    CGFloat priceW =100;
//    CGFloat priceH =20 ;
//    self.priceLabel.frame=CGRectMake(priceX, priceY, priceW, priceH);
//    CGFloat buyCountX =self.contentView.frame.size.width-110;
//    CGFloat buyCountY =self.contentView.frame.size.height-30;
//    CGFloat buyCountW =100;
//    CGFloat buyCountH =20 ;
//    self.buyCountLabel.frame=CGRectMake(buyCountX, buyCountY, buyCountW, buyCountH);
//}
#pragma mark -约束确定位置和尺寸
- (void)layoutSubviews{
    [super layoutSubviews];
}
@end
