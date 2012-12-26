//
//  NavigationViewController.h
//  MyGPSLocation
//
//  Created by Coming on 12/12/23.
//  Copyright (c) 2012年 Coming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpeedUIView.h"
#import "NavigationEngine.h"
#import "SpeedChangeListener.h"
#import "linmsdebug.h"

typedef enum {
    METER,
    MILE
} DistanceUnit;

@interface NavigationViewController : UIViewController<NavigationEngineSpeedChangeDelegate>
{
    NavigationEngine *navigationEngine;
    DistanceUnit distanceUnit;
}
- (IBAction)SwitchBackToMainMenu:(id)sender;
@property (weak, nonatomic) IBOutlet SpeedUIView *SpeedUIView;
@property (weak, nonatomic) IBOutlet SpeedUIView *NavigationUIView;
@property (weak, nonatomic) IBOutlet UILabel *SpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *SpeedUnitLabel;

-(void)updateKMHSpeed:(double)speed;
-(void)updateMHSpeed:(double)speed;


@end
