//
//  AppDelegate.m
//  helloword
//
//  Created by 闫瑞锋 on 2025/3/23.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//应用程序启动完毕后diadFinishLaunchingWithOptions方法会被调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"应用程序启动完毕");
       self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //加载指定的控制器
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
       UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    // 2. 加载箭头指向的控制器
//    UIViewController *vc1=  [storyboard instantiateInitialViewController];
       
//    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
       // 3. 设置根控制器
       self.window.rootViewController = vc;
       NSLog(@"隐藏%@",self.window);
       [self.window makeKeyAndVisible]; //设置应用程序的主窗口，并显示出来
       NSLog(@"显示%@",self.window);

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
