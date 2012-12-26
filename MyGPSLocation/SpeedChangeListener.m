//
//  SpeedChangeListener.m
//  MyGPSLocation
//
//  Created by Coming on 12/12/25.
//  Copyright (c) 2012年 Coming. All rights reserved.
//

#import "SpeedChangeListener.h"

@implementation SpeedChangeListener

@synthesize name=_name;

- (void)updateKMHSpeed:(double)speed
{
    NSLog(@"%@ updateKMHSpeed\n", [self name]);
}

-(void)updateSpeed:(double)speed1 speed2:(double)speed2 speed3:(double)speed3
{
    NSLog(@"%@ support updateSpeed with 3 parameter", [self name]);
}
@end
