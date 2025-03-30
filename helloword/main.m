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
        NSArray * array =@[@"张三" ,@"李四",@"王五",@"赵六"];
        BOOL ifFlag = [array writeToFile:@"/Users/yanruifeng/Desktop/helloword/helloword/test.plist" atomically:YES];
        if(ifFlag){
            NSLog(@"写入成功");
        }
        NSLog(@"%@",array);
        NSString *path =[[NSBundle mainBundle] pathForResource:@"test.plist" ofType:nil];
        NSArray *readArr = [NSArray arrayWithContentsOfFile:path];
        NSLog(@"%@",[readArr componentsJoinedByString:@","]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
