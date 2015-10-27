//
//  AppDelegate.m
//  NewOne
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 丛蕾. All rights reserved.
//

#import "AppDelegate.h"
#import "UITabBarController+ZJExtension.h"
#import "appListViewController.h"
#import "mainViewController.h"
#import "titleViewController.h"
#import "questViewController.h"
#import "thingViewController.h"
#import "meViewController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self creatAnmiation];
    return YES;
}
- (void)creatAnmiation{
    appListViewController *vc = nil;
    UITabBarController *tbc = [[UITabBarController alloc] init];
    
    vc = [tbc addViewControlerWithClass:[mainViewController class] title:@"首页" image:@"home@2x.png" selectImage:@"homeSelected@2x.png"];
    
    
    vc = [tbc addViewControlerWithClass:[titleViewController class] title:@"文章" image:@"reading@2x.png" selectImage:@"readingSelected@2x.png"];
    
    
    vc = [tbc addViewControlerWithClass:[questViewController class] title:@"问题" image:@"question@2x.png" selectImage:@"questionSelected@2x.png"];
    
    
    [tbc addViewControlerWithClass:[thingViewController class] title:@"东西" image:@"thing@2x.png" selectImage:@"thingSelected@2x.png"];
    
    vc = [tbc addViewControlerWithClass:[meViewController class] title:@"个人" image:@"person@2x.png" selectImage:@"personSelected@2x.png"];
    
//    //标签栏view, 添加imageView, 添加UIView动画
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,ScreenHeight)];
//    imageView.image = [UIImage imageNamed:@"5loading.png"];
//    
//    [tbc.view addSubview:imageView];
//    
//    [UIView animateWithDuration:0.1 delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        imageView.alpha = 0;
//    } completion:^(BOOL finished) {
//        [imageView removeFromSuperview];
//    }];
//    
    self.window.rootViewController = tbc;
    self.window.backgroundColor = [UIColor whiteColor];
  
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
