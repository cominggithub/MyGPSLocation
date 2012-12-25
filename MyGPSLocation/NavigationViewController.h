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

@interface NavigationViewController : UIViewController
{
    NavigationEngine *navigationEngine;
    SpeedChangeListener *speedChangeListener1;
    SpeedChangeListener *speedChangeListener2;
}
- (IBAction)SwitchBackToMainMenu:(id)sender;
@property (weak, nonatomic) IBOutlet SpeedUIView *SpeedUIView;
@property (weak, nonatomic) IBOutlet SpeedUIView *NavigationUIView;

@end
