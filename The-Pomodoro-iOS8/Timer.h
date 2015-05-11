//
//  Timer.h
//  The-Pomodoro-iOS8
//
//  Created by Skyler Clark on 5/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *SecondTickNotification = @"secondTickNotification";
static NSString *TimerCompleteNotification = @"timerCompleteNotification";
static NSString *NewRoundNotification = @"newRoundNotification";
@interface Timer : NSObject

@property (nonatomic, assign) NSInteger minutes;
@property (nonatomic, assign) NSInteger seconds;

+ (instancetype)sharedInstance;

- (void)startTimer;

-(void)cancelTimer;
@end
