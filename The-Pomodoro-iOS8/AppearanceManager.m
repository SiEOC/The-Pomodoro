//
//  AppearanceManager.m
//  The-Pomodoro-iOS8
//
//  Created by Parker Donat on 5/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "AppearanceManager.h"
#import "TimerViewController.h"


@implementation AppearanceManager

+(void)setUpDefaultAppearance
{
    
    [[UILabel appearance] setBackgroundColor:[UIColor greenColor]];
    [[UILabel appearance] setAlpha:0.7];
//    [[UILabel appearance] setTextColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName : [UIColor blackColor],
                                                           NSFontAttributeName: [UIFont fontWithName:@"Avenir-Light" size:32]
                                                           }];
    
}

@end
