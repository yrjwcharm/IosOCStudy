//
//  MainViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"
#import "MJExtension.h"
@interface ViewControler ()
@end

@implementation ViewControler

- (void) viewDidLoad{
    [super viewDidLoad];
    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_icon.png"]];
    UIImageView *imageView =[[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"app_icon.png"];
    [imageView sizeToFit];
    [self.view addSubview:imageView];
}
- (IBAction)btnOpenUrl:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            NSLog(@"%@",success ? @"成功" : @"失败");
        }];
    }else{
        NSLog(@"不支持");
    }
}

@end
