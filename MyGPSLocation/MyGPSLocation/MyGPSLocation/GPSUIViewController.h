//
//  GPSUIViewController.h
//  MyGPSLocation
//
//  Created by Coming on 12/12/17.
//  Copyright (c) 2012年 Coming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "linmsdebug.h"

@interface GPSUIViewController : UIViewController<CLLocationManagerDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;

@property (nonatomic, retain) CLLocationManager *locationManager;
@end
