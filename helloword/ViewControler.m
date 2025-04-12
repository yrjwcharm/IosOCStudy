//
//  MainViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"

@interface MainViewControler ()
@end

@implementation MainViewControler

- (void)viewDidLoad {
    [super viewDidLoad];
    //蓝色View
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor=[UIColor blueColor];
    //禁止autoresizingMask自动转化约束
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    //红色View
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor=[UIColor redColor];
    //禁止autoresizingMask自动转化约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    //添加约束 -水平方向 options 水平与垂直对齐方式
    NSString *hvfl = @"H:|-space-[blueView]-space-[redView(==blueView)]-space-|";
//    NSDictionary *views =@{@"blueView":blueView,@"redView":redView};
    NSDictionary *views = NSDictionaryOfVariableBindings(blueView,redView);
    NSDictionary *metrics =@{@"space":@30};
    NSArray *hlcs = [NSLayoutConstraint constraintsWithVisualFormat:hvfl options:NSLayoutFormatAlignAllTop |NSLayoutFormatAlignAllBottom metrics:metrics views:views];
    [self.view addConstraints:hlcs];
    //添加约束 -垂直方向
    NSString *vvfl = @"V:[blueView(40)]-space-|";
    NSArray *vlcs = [NSLayoutConstraint constraintsWithVisualFormat:vvfl options:kNilOptions metrics:metrics views:views];
    [self.view addConstraints:vlcs];
    //顶部对齐
//    NSLayoutConstraint *tooplcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
//    [self.view addConstraint:tooplcs_r];
//    //底部对齐
//    NSLayoutConstraint *botomlcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
//    [self.view addConstraint:botomlcs_r];
    
}
-(void) test:(NSNumber *) space{
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor=[UIColor redColor];
    //禁止autoresizingMask自动转化约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
#pragma mark -  VFL语言 添加约束
    //1、水平方向
    NSString *hvfl =@"H:|-space-[abc]-space-|";
    NSDictionary *views =@{@"abc":redView};
    NSDictionary *metrics =@{@"space":space};
   NSArray *hlcs=  [NSLayoutConstraint constraintsWithVisualFormat:hvfl options:kNilOptions metrics:metrics views:views];
    [self.view addConstraints:hlcs];
    //2.垂直方向
    NSArray *array =[NSLayoutConstraint constraintsWithVisualFormat:@"V:[abc(40)]-space-|" options:kNilOptions metrics:metrics views:views];
    [self.view addConstraints:array];
    
}
@end
