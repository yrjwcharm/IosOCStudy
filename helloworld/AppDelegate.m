//
//  AppDelegate.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "AppDelegate.h"
#import "RootViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

//应用程序启动完毕后diadFinishLaunchingWithOptions方法会被调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"应用程序启动完毕");
     //1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor =[UIColor orangeColor];
    //2.设置窗口的根视图控制器
    //2.1.通过storyboard创建控制器 instantiateInitialViewController会加载箭头指向的控制器
//    RootViewController *rootVC = [storyboard instantiateInitialViewController];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RootViewController *rootVC = [storyboard instantiateInitialViewController];
//    RootViewController *rootVC =  [storyboard instantiateViewControllerWithIdentifier:@"rootVC"];
//    rootVC.view.backgroundColor = [UIColor whiteColor];
    //会找与当前控制器相同名字的xib文件 如果没有的话，还会继续找去掉Controller后缀的xib文件
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootVC];
    //3.显示窗口
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}
//应用程序将要失去焦点时会调用这个方法
-(void)applicationWillResignActive:(UIApplication *)application{
    NSLog(@"应用程序即将进入非活动状态");
}
//应用程序进入后台时会调用这个方法
- (void)applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"应用程序进入后台");
}
//应用程序进入前台时会调用这个方法

- (void)applicationWillEnterForeground:(UIApplication *)application{
    NSLog(@"应用程序将要进入前台");
}
//应用程序重新获得焦点时会调用这个方法
- (void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"应用程序重新获得焦点");
}
//应用程序将要被销毁时会调用这个方法
- (void)applicationWillTerminate:(UIApplication *)application{
    NSLog(@"应用程序将要被销毁");
}
//当应用程序收到内存警告时会调用这个方法
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    NSLog(@"应用程序内存不足");
}
@end
