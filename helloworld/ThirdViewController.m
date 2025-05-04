//
//  ThirdViewController.m
//  helloworld
//
//  Created by 闫瑞锋 on 2025/5/4.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)btnIntent:(id)sender {
   [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
}
- (IBAction)btnSkipRoot:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
