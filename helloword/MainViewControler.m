//
//  MainViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "MainViewControler.h"

@interface MainViewControler ()
@property (weak, nonatomic) IBOutlet UITextField *num2;
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (weak, nonatomic) IBOutlet UITextField *num1;
@property (weak, nonatomic) IBOutlet UIButton *btnCalc;
@end

@implementation MainViewControler

- (void)viewDidLoad {
    [super viewDidLoad];
    self.num1.keyboardType = UIKeyboardTypeNumberPad;
    self.num2.keyboardType = UIKeyboardTypeNumberPad;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)calcResult:(UIButton *)sender {
    NSString *num1 = self.num1.text;
    NSString *num2 = self.num2.text;
    if(num1.length==0){
//        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确定要退出嘛?" message:@"显示的信息" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    NSLog(@"点击了取消");
            }];
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                    NSLog(@"点击了确定");
                    [self.navigationController popViewControllerAnimated:YES];
            }];
           
            [alertController addAction:action];
            [alertController addAction:action1];
//        });
        [self presentViewController:alertController animated:YES completion:nil];
        NSLog(@"请输入第一个数字");
        
        return;
    }
    if(num2.length==0){
        NSLog(@"请输入第二个数字");
        return;
    }
    NSInteger result = [num1 integerValue] + [num2  integerValue];
    self.result.text = [NSString stringWithFormat:@"%ld",result];
    
}

@end
