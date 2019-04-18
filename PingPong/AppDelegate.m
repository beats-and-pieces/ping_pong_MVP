//
//  AppDelegate.m
//  PingPong
//
//  Created by Anton Kuznetsov on 07/04/2019.
//  Copyright © 2019 Anton Kuznetsov. All rights reserved.
//

#import "AppDelegate.h"
#import "GameViewController.h"
#import "GameViewPresenter.h"
#import "SettingsViewPresenter.h"
#import "SettingsViewController.h"
#import "GameSettings.h"

@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    GameViewController *gameVC = [[GameViewController alloc] init];
    GameSettings *gameSettings = [[GameSettings alloc] init];
    GameViewPresenter *gameVP = [[GameViewPresenter alloc] initForAView:gameVC withSettings:gameSettings];
    gameVC.gameViewPresenter = gameVP;

    gameVC.tabBarItem.title = @"Игра";

    
    SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
    SettingsViewPresenter *settingsVP = [[SettingsViewPresenter alloc] initForAView:settingsVC];
    settingsVC.settingsViewPresenter = settingsVP;
    settingsVC.tabBarItem.title = @"Настройки";

    NSArray *viewControllerArray = @[gameVC, settingsVC];
    UITabBarController *tabBarViewController = [[UITabBarController alloc] init];
    tabBarViewController.tabBar.translucent = YES;
    tabBarViewController.tabBar.tintColor = [UIColor whiteColor];
    tabBarViewController.tabBar.barTintColor = [UIColor blackColor];
    
    tabBarViewController.viewControllers = viewControllerArray;
    self.window.rootViewController = tabBarViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
