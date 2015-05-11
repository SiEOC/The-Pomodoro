//
//  Timer.m
//  The-Pomodoro-iOS8
//
//  Created by Skyler Clark on 5/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Timer.h"

@implementation Timer


+ (Timer *)sharedInstance {
    static Timer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Timer alloc] init];
    });
    
    return sharedInstance;
}



@end
