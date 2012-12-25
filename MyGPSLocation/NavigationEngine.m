//
//  NavigationEngine.m
//  MyGPSLocation
//
//  Created by Coming on 12/12/25.
//  Copyright (c) 2012年 Coming. All rights reserved.
//

#import "NavigationEngine.h"



@implementation NavigationEngine

@synthesize speedChangeDelegate=_speedChangeDelegate;

-(void)speedChange
{
    [self.speedChangeDelegate updateKMHSpeed:1.11];
}

@end
