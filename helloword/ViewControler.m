//
//  MainViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

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
    //添加新的约束
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left).offset(30);
        make.bottom.equalTo(self.view.bottom).offset(-30);
        make.right.equalTo(redView.left).offset(-30);
        make.width.equalTo(redView.width);
//        make.height.equalTo(50);
    }];
    //添加新的约束
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.right).width.offset(-30);
        make.top.equalTo(blueView.top);
        make.bottom.equalTo(blueView.bottom);

    }];
    //正常写法是不对的
//    [blueView makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(80);
//    }];
    //之前没有约束 就会添加约束
    [blueView updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(80);
    }];
    //删除之前所有的约束，添加新的约束
//    [blueView remakeConstraints:^(MASConstraintMaker *make) {
//        
//    }];
  //with/and
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
