//
//  AppDelegate.m
//  The-Pomodoro-iOS8
//
//  Created by Taylor Mott on 18.2.2015.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "AppDelegate.h"
#import "TimerViewController.h"
#import "RoundsViewController.h"
#import "AppearanceManager.h"
#import "Timer.h"
#import "RoundsController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions

{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [AppearanceManager setUpDefaultAppearance];
    
    TimerViewController *timerVC = [[TimerViewController alloc]init];
    
    timerVC.tabBarItem.title = @"Timer";
    timerVC.tabBarItem.image = [UIImage imageNamed:@"timer.png"];
    
    RoundsViewController *roundsVC =[[RoundsViewController alloc]init];
    UINavigationController *roundsNavController = [[UINavigationController alloc]initWithRootViewController:roundsVC];
    
    
    roundsNavController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Rounds" image:[UIImage imageNamed:@"boxing.png"] tag:1];
   
    UITabBarController  *tabBarController = [[UITabBarController alloc]init];
    
    tabBarController.viewControllers = @[timerVC, roundsNavController];
    
    self.window.rootViewController = tabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[Timer sharedInstance] prepareForBackground];
    
}
   

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[Timer sharedInstance] loadFromBackground];
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {

    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound) categories:nil]];
    }
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Round Finished B!" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault handler:nil]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Start Next Round" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:TimerCompleteNotification object:nil];
        [[Timer sharedInstance] startTimer];
    }]];
    
    [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
}

@end
