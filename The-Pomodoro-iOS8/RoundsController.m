//
//  RoundsController.m
//  The-Pomodoro-iOS8
//
//  Created by Skyler Clark on 5/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RoundsController.h"

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

-(NSArray *)roundTimes
{
    return @[@25,@5,@25,@5,@25,@5,@25,@15];
}






@end
