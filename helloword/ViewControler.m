//
//  ViewController.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *redView = [[UIView alloc] init];
    [redView setBackgroundColor:[UIColor redColor]];
    redView.frame =CGRectMake(0, 0, 50, 50);
    [self.scrollView addSubview:redView];
    self.scrollView.clipsToBounds = YES;
    //contentSize 尺寸小于等于scrollview尺寸不能滚动
    self.scrollView.contentSize =CGSizeMake(301, 201);
//    self.scrollView.scrollEnabled =NO;
#pragma scrollview以及内部所有的子控件都不能给用户交互 ，点击/拖拽所有操作都不能响应
    self.scrollView.userInteractionEnabled=NO;
}

@end
