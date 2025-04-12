//
//  MainViewControler.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "ViewControler.h"

@interface MainViewControler ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation MainViewControler

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.label.text =@"sss";
    
}
@end
