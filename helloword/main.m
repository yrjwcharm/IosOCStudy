//
//  main.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        NSArray * array =@[@{@"icon":@"1.png",@"name":@"张三"} ,@{@"icon":@"2.png",@"name":@"李四"}];
        BOOL ifFlag = [array writeToFile:@"/Users/yanruifeng/Desktop/helloword/helloword/test.plist" atomically:YES];
        if(ifFlag){
            NSLog(@"写入成功");
        }
        NSLog(@"%@",[array componentsJoinedByString:@","]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
