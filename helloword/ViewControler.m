//
//  MainViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"
#import "Masonry.h"
@interface MainViewControler ()
@end

@implementation MainViewControler

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *blueView =[[UIView alloc] init];
    blueView.backgroundColor =[UIColor blueColor];
    [self.view addSubview:blueView];
    UIView *redView =[[UIView alloc] init];
    redView.backgroundColor =[UIColor redColor];
    [self.view addSubview:redView];
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(30);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-30);
        make.right.mas_equalTo(redView.mas_left).offset(-30);
        make.width.mas_equalTo(redView.mas_width);
        make.height.mas_equalTo(50);
    }];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.mas_right).offset(-30);
        make.top.mas_equalTo(blueView.mas_top);
        make.bottom.mas_equalTo(blueView.mas_bottom);

    }];
  
}
-(void)center{
    UIView *redView =[[UIView alloc] init];
    redView.backgroundColor =[UIColor redColor];
    [self.view addSubview:redView];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(100);
//        make.height.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(100, 100));
//        make.centerX.mas_equalTo(self.view.mas_centerX);
//        make.centerY .mas_equalTo(self.view.mas_centerY);
        make.center.mas_equalTo(self.view);
    }];
}
-(void)edges{
    UIView *redView =[[UIView alloc] init];
    redView.backgroundColor =[UIColor redColor];
    [self.view addSubview:redView];
    //    使用AutoLayout必须要禁用掉AutoresizingMask Masonry.h框架默认已经包含这行代码
    //    redView.translatesAutoresizingMaskIntoConstraints =NO;
        //2.添加约束
    //    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
    ////        红色View.top 等于父控件的top * 1 + offset
    //        make.top.offset(20);
    //        make.right.offset(-20);
    //        make.bottom.offset(-20);
    //        make.left.offset(20);
    //    }];
        [redView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view.mas_safeAreaLayoutGuide).insets(UIEdgeInsetsMake(0, 20, 0, 20));
        }];
        
        
}
@end
