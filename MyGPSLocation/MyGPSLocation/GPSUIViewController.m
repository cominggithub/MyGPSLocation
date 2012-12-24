//
//  GPSUIViewController.m
//  MyGPSLocation
//
//  Created by Coming on 12/12/17.
//  Copyright (c) 2012年 Coming. All rights reserved.
//

#import "GPSUIViewController.h"


@interface GPSUIViewController ()

@end


@implementation GPSUIViewController 

@synthesize locationManager;
@synthesize longitudeLabel;
@synthesize latitudeLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    linmspl();
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
    
    }
    return self;
}

- (void)viewDidLoad
{
 
    linmspl();
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    linmspl();
    CLLocation *cl = (CLLocation*)[locations lastObject];
    longitudeLabel.text = [[NSNumber numberWithDouble:cl.coordinate.longitude] stringValue];
    latitudeLabel.text = [[NSNumber numberWithDouble:cl.coordinate.latitude] stringValue];
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error\n");
}

@end
