//
//  MainViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "MainViewControler.h"

@interface MainViewControler ()
@property (weak, nonatomic) IBOutlet UILabel *lbUserName;
@end

@implementation MainViewControler

- (void)viewDidLoad {
    [super viewDidLoad];

    self.lbUserName.text=@"测试一行白鹭上青天，朝辞白帝彩云间";
    self.lbUserName.lineBreakMode=NSLineBreakByTruncatingTail;
    self.lbUserName.textColor=[UIColor redColor];
    self.lbUserName.frame= CGRectMake(10, 70, 500, 100);
    self.lbUserName.backgroundColor =[UIColor orangeColor];
    self.lbUserName.shadowOffset=CGSizeMake(0, -5);
    self.lbUserName.shadowColor = [UIColor whiteColor];
    UIImageView *userAvatar = [[UIImageView alloc] init];
    userAvatar.backgroundColor =[UIColor greenColor];
    userAvatar.frame =CGRectMake(50, 50, 200, 100);
    UIImage *image = [UIImage imageNamed:@"ic_live"];
    userAvatar.image = image;
    userAvatar.contentMode = UIViewContentModeScaleAspectFill;
    userAvatar.clipsToBounds =YES;
    [self.view addSubview:userAvatar];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
