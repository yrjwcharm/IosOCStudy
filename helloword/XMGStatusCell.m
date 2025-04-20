//
//  XMGStatusCell.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/4/20.
//

#import "XMGStatusCell.h"
#import "XMGStatus.h"
@interface XMGStatusCell()
@property(nonatomic,weak) UIImageView *iconImageView;
@property(nonatomic,weak) UILabel *nameLabel;
@property(nonatomic,weak) UIImageView *vipImageView;
@property(nonatomic,weak) UILabel *text_label;
@property(nonatomic,weak) UIImageView *pictureImageView;
@end
@implementation XMGStatusCell

//添加子控件的原则；把所有有可能显示的子控件都先添加进去
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UIImageView *imageView =[[UIImageView alloc] init];
        imageView.backgroundColor=[UIColor redColor];
        [self.contentView addSubview:imageView];
        self.iconImageView = imageView;
        UILabel *nameLabel =[[UILabel alloc] init];
        nameLabel.backgroundColor=[UIColor greenColor];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        UILabel *textLabel =[[UILabel alloc] init];
        textLabel.backgroundColor=[UIColor blueColor];
        [self.contentView addSubview:textLabel];
        self.text_label = textLabel;
        UIImageView *vipImageView =[[UIImageView alloc] init];
        vipImageView.image=[UIImage imageNamed:@"8-cake.png"];
        vipImageView.backgroundColor=[UIColor yellowColor];
        [self.contentView addSubview:vipImageView];
        self.vipImageView = vipImageView;
        UIImageView *pictureImageView =[[UIImageView alloc] init];
        pictureImageView.backgroundColor=[UIColor orangeColor];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView = pictureImageView;
    }
    return self;
}
//计算位置和尺寸 没有设置位置和尺寸 显示不出来的
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat space  =10;
    CGFloat iconX = space;
    CGFloat iconY = space;
    CGFloat iconWH =30;
    self.iconImageView.frame =CGRectMake(iconX, iconY, iconWH, iconWH);
}
//给模型传递数据 重写模型的set方法
- (void)setStatus:(XMGStatus *)status{
    _status = status;
    self.iconImageView.image =[UIImage imageNamed:status.icon];
    self.nameLabel.text =status.name;
    self.text_label.text = status.text;
    //考虑到循环利用 有IF 就有Else
    if(status.isVip){
        self.imageView.hidden =NO;
    }else{
        self.imageView.hidden =YES;
    }
    if([status.picture length]>0){
        self.pictureImageView.hidden =NO;
        self.pictureImageView.image =[UIImage imageNamed:status.picture];

    }else{
        self.pictureImageView.hidden=YES;
    }
    
}
@end
