//
//  RoundsController.m
//  The-Pomodoro-iOS8
//
//  Created by Skyler Clark on 5/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RoundsController.h"
#import "Timer.h"

@interface RoundsController()

@property (strong, nonatomic) NSArray *roundTimes;

@end

@implementation RoundsController


+ (RoundsController *)sharedInstance {
    static RoundsController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RoundsController alloc] init];
    });
    
    return sharedInstance;
}

-(void)roundSelected
{
    [Timer sharedInstance].minutes = [[self roundTimes][self.currentRound]integerValue];
    [Timer sharedInstance].seconds = 0;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NewRoundNotification object:nil];
}

-(NSArray *)roundTimes
{
    return @[@25,@1,@25,@5,@25,@5,@25,@15];
}

+ (NSArray *)imageNames
{
    return @[@"Running", @"Football", @"Running", @"Football", @"Running", @"Football", @"Running", @"Sleeping"];
}

@end
