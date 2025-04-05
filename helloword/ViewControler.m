//
//  ViewController.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//
#import "ViewControler.h"
#import "XMGCar.h"
/**
 验证是否是任何oc对象都可以作为ScrollView的代理
 苹果为什么把代理设置成weak 防止出现循环引用，导致内存泄漏
 代理监听控件的某些行为 代理
 */
@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtInput;
@property(nonatomic,strong) XMGCar *car;
@end

@implementation ViewController
//只是代表控制器View加载完毕
- (void)viewDidLoad {
    [super viewDidLoad];
    self.car =[[XMGCar alloc] init];
    //id类型 任何oc类型的对象 万物皆对象
    //通过代码创建的scrollView 一开始subviews这个数组为nill
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 80, 300, 200)];
    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    UIImage *image = [UIImage imageNamed:@"jieping.jpg"];
    UIImageView *imageVew =[[UIImageView alloc] initWithImage:image];
    [scrollView addSubview:imageVew];
    scrollView.contentSize =image.size;
    //根据oc ARC法则 一旦对象创建出来那一刻若没有强指针引用它 就会被销毁掉
    scrollView.delegate =self.car;
    //TextField比较特殊 技可以通过addTarget 也可以通过代理
    self.txtInput.delegate = self;
//    [self.txtInput addTarget:self action:@selector(beginEditing) forControlEvents:UIControlEventEditingDidBegin];
//    [self.txtInput addTarget:self action:@selector(endEditing) forControlEvents:(UIControlEvents)UIControlEventEditingDidEnd];
//    [self.txtInput addTarget:self action:@selector(onChangeText:) forControlEvents:UIControlEventEditingChanged];
    
}
#pragma mark - 1.通过代理 代理方法都是控件名开头的
-(void) textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"开始编辑");
}
-(void) textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"结束编辑");
}
-(void) textFieldDidChangeSelection:(UITextField *)textField{
    NSLog(@"内容改变-----%@",textField.text);
}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //退出键盘
//    [self.txtInput endEditing:YES];
    //不再成为第一响应者意味着退出键盘-----, 第一响应者可以调出键盘
//    [self.txtInput resignFirstResponder];
    [self.view endEditing:YES];  //这个常用
}
#pragma mark -2.通过addTarget
-(void)beginEditing{
    NSLog(@"开始编辑----");
}
-(void)endEditing{
    NSLog(@"结束编辑----");
}
-(void)onChangeText:(UITextField *) textFiled{
    NSLog(@"内容改变------%@",textFiled.text);
}
@end
