//
//  GPSUIViewController.h
//  MyGPSLocation
//
//  Created by Coming on 12/12/17.
//  Copyright (c) 2012年 Coming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>
#import "NavigationViewController.h"
#import "linmsdebug.h"

@interface GPSUIViewController : UIViewController<CLLocationManagerDelegate>
{
    double curSpeed;
    CLLocationCoordinate2D curCoordinate;
    bool reverseTransform;
    bool useSimulator;
}
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UIView *SpeedUIView;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (strong, nonatomic) IBOutlet NavigationViewController *navigationViewController;

@property (nonatomic, retain) CLLocationManager *locationManager;
@property double speed;

-(void)updateLocation:(CLLocation*)newLocation;
-(IBAction)changeTransform:(UITapGestureRecognizer *)sender;
-(IBAction)changeMode:(UITapGestureRecognizer *)sender;
-(IBAction)navigationMode:(id)sender;
-(void)startSimulator;
-(void)stopSimulator;


@end
