//
//  MainViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "MainViewControler.h"

@interface MainViewControler ()
@property(nonatomic,strong) UIButton *btnLoad;
@property(nonatomic,strong) UIButton *btnDestroy;
@property(nonatomic,strong) NSMutableArray<UIImage *> *images;
@end

@implementation MainViewControler
- (NSMutableArray<UIImage *> *)images{
    if(!_images){
        _images =[NSMutableArray array];
    }
    return  _images;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnLoad =[[UIButton alloc]init];
       self.btnDestroy =[[UIButton alloc] initWithFrame:(CGRect){{100,300},{80,30}}];
       [self.btnDestroy setTitle:@"销毁" forState:UIControlStateNormal];
       [self.btnDestroy addTarget:self action:@selector(btnReleaseMemory) forControlEvents:UIControlEventTouchUpInside];
    [self.btnDestroy setBackgroundColor:[UIColor redColor]];
       self.btnLoad.frame= CGRectMake(20, 20, 100, 100);
       self.btnLoad.backgroundColor=[UIColor greenColor];
       [self.view addSubview:self.btnDestroy];
       [self.btnLoad setTitle:@"点击我" forState:UIControlStateNormal];
       [self.btnLoad addTarget:self
                   action:@selector(loadImage)  // 关联方法
        forControlEvents:UIControlEventTouchUpInside]; // 事件类型
       [self.view addSubview:self.btnLoad];
}
- (void) loadImage{
    for (int i =0; i<3; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]];
        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d",i+1] ofType:@"png"]];
        [self.images addObject:image];
    }
    NSLog(@"走了呀%zd",self.images.count);
    
}
- (void) btnReleaseMemory{
    [self.images removeAllObjects];
    NSLog(@"销毁%zd",self.images.count);
    self.images = nil;
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
