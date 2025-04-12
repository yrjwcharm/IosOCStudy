//
//  MainViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"

@interface MainViewControler ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redW;
@end

@implementation MainViewControler

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.redW.constant = 50;
    [UIView animateWithDuration:2 animations:^{
        [self.view layoutIfNeeded]; //强制刷新
        //直接放置内部执行 不会有动画 因为他是NSLayoutConstraint约束对象 不是UIView
//        self.redW.constant = 50;
        //只有先更改约束 再调用 [self.view layoutIfNeeded];才可

    }];
}
@end
