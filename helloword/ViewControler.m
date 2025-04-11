//
//  ViewController.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//
#import "ViewControler.h"

#import "XMGPageView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    XMGPageView *pageView =[XMGPageView pageView];
//    [pageView setBackgroundColor:[UIColor redColor]];
    pageView.center = self.view.center;
    pageView.images =@[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"];
    [self.view addSubview:pageView];
}
@end
