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
@synthesize speedChangeDelegates=_speedChangeDelegates;


-(void)registerNavigationEngineSpeedChangeEvent:(id<NavigationEngineSpeedChangeDelegate>) delegate
{
    NSValue *value = [NSValue valueWithNonretainedObject:delegate];
    if ([self.speedChangeDelegates containsObject:value] == FALSE)
    {
        linmsfns(@"add object %@", [delegate description]);
        [self.speedChangeDelegates addObject:value];
    }
    else
    {
        linmsfns(@"cannot add duplicate object %@", [delegate description]);        
    }
    NSLog(@"delegate count: %d\n", [self.speedChangeDelegates count]);
     
}

-(void)unregisterNavigationEngineSpeedChangeEvent:(id<NavigationEngineSpeedChangeDelegate>) delegate
{
    
}

- (id) init
{
    if(self = [super init])
    {
        self.speedChangeDelegates = (NSMutableArray*)[[NSMutableArray alloc] initWithCapacity:0];
    }
    
    return self;
}

-(void)speedChange
{
    NSLog(@"delegate count: %d\n", [self.speedChangeDelegates count]);
    for( NSValue *v in self.speedChangeDelegates)
    {
        id<NavigationEngineSpeedChangeDelegate> delegate = (id<NavigationEngineSpeedChangeDelegate>)[v nonretainedObjectValue];
        if ([delegate respondsToSelector:@selector(updateKMHSpeed:)])
        {
            [delegate updateKMHSpeed:1.0];
        }
        
        if ([delegate respondsToSelector:@selector(updateMHSpeed:)])
        {
            [delegate updateMHSpeed:1.0];
        }
    
    
        if ([delegate respondsToSelector:@selector(updateSpeed:speed2:speed3:)])
        {
            [delegate updateSpeed:1.0 speed2:2.0 speed3:3.0];
        }
    }
}

@end
