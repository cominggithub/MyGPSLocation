//
//  NavigationEngine.h
//  MyGPSLocation
//
//  Created by Coming on 12/12/25.
//  Copyright (c) 2012年 Coming. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NavigationEngineSpeedChangeDelegate <NSObject>
@optional
-(void)updateKMHSpeed:(double)speed;
-(void)updateMHSpeed:(double)speed;

@end

@interface NavigationEngine : NSObject
@property (nonatomic, weak) id<NavigationEngineSpeedChangeDelegate> speedChangeDelegate;

-(void)speedChange;
@end
