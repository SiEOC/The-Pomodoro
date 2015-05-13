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
static NSString *expirationKey = @"expiration";

@interface Timer : NSObject

@property (nonatomic, assign) NSInteger minutes;
@property (nonatomic, assign) NSInteger seconds;

+ (Timer *)sharedInstance;

- (void)startTimer;
- (void)cancelTimer;
- (void)prepareForBackground;
- (void)loadFromBackground;


@end
