//
//  RoundsController.h
//  The-Pomodoro-iOS8
//
//  Created by Skyler Clark on 5/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RoundsController : NSObject

@property (strong, nonatomic,readonly) NSArray *roundTimes;
@property (assign, nonatomic) NSInteger currentRound;

@end
