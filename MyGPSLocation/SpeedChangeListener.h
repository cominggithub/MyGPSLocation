//
//  SpeedChangeListener.h
//  MyGPSLocation
//
//  Created by Coming on 12/12/25.
//  Copyright (c) 2012年 Coming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NavigationEngine.h"
#import "linmsdebug.h"

@interface SpeedChangeListener : NSObject<NavigationEngineSpeedChangeDelegate>

@property (nonatomic, strong) NSString* name;

- (void)updateKMHSpeed:(double)speed;

@end
