//
//  NavigationEngine.h
//  MyGPSLocation
//
//  Created by Coming on 12/12/25.
//  Copyright (c) 2012年 Coming. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "linmsdebug.h"

@protocol NavigationEngineSpeedChangeDelegate <NSObject>
@optional
-(void)updateKMHSpeed:(double)speed;
-(void)updateMHSpeed:(double)speed;
-(void)updateSpeed:(double)speed1 speed2:(double)speed2 speed3:(double)speed3;

@end

@interface NavigationEngine : NSObject

@property (nonatomic, weak) id<NavigationEngineSpeedChangeDelegate> speedChangeDelegate;
@property (nonatomic, strong) NSMutableArray *speedChangeDelegates;

-(void)registerNavigationEngineSpeedChangeEvent:(id<NavigationEngineSpeedChangeDelegate>) delegate;
-(void)unregisterNavigationEngineSpeedChangeEvent:(id<NavigationEngineSpeedChangeDelegate>) delegate;
-(void)speedChange;
@end
