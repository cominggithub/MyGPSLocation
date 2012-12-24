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

@synthesize locationManager=_locationManager;
@synthesize longitudeLabel=_longitudeLabel;
@synthesize latitudeLabel=_latitudeLabel;
@synthesize speed=_speed;
@synthesize navigationViewController=_navigationViewController;


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
    self.navigationViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NavigationViewController"];

    
//    NSLog(@"%@", [self.navigationViewController description]);
//    _speedLabel.transform = CGAffineTransformMakeScale(-1,1);
    self.speed              = 0;
    curSpeed                = 0;
    curCoordinate.latitude  = 0;
    curCoordinate.longitude = 0;
    reverseTransform        = false;
    useSimulator            = false;
    [self.speedLabel setFont:[UIFont fontWithName:@"Crystal" size:180]];
    [self startSimulator];
    
    [UIApplication sharedApplication].idleTimerDisabled = YES;
	// Do any additional setup after loading the view.
}

-(IBAction)changeMode:(UITapGestureRecognizer *)sender
{
    linmspl();
    if(useSimulator == false)
        [self startSimulator];
    else
        [self stopSimulator];
}

-(void)startSimulator
{
    useSimulator = true;
    [self.locationManager stopUpdatingLocation];
    [NSThread detachNewThreadSelector:@selector(startThread) toTarget:self withObject:nil];
}

-(void)stopSimulator
{
    useSimulator = false;
    [self.locationManager startUpdatingLocation];
}

-(void)startThread
{
    [self performSelectorOnMainThread:@selector(generateNewLocation) withObject:nil waitUntilDone:NO];
    
}

-(void)generateNewLocation
{
    
    CLLocation* newLocation = [[CLLocation alloc] initWithCoordinate:curCoordinate altitude:0 horizontalAccuracy:0 verticalAccuracy:0 course:0 speed:curSpeed timestamp:nil];
    
    [self updateLocation:newLocation];
    
    curCoordinate.latitude += 0.001;
    curCoordinate.longitude += 0.002;
    
    curSpeed += 0.4;
    if (curSpeed > 999)
        curSpeed = 0;
    
    if(useSimulator)
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(generateNewLocation) userInfo:nil repeats:NO];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    [self updateLocation:(CLLocation*)[locations lastObject]];
    
    
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{

    [self updateLocation:newLocation];
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    linmspl();
    NSLog(@"error\n");
}

-(void)updateLocation:(CLLocation*)newLocation
{
    _longitudeLabel.text = [NSString stringWithFormat:@"%.5f", newLocation.coordinate.longitude];
    _latitudeLabel.text = [NSString stringWithFormat:@"%.5f", newLocation.coordinate.latitude];
    self.speed = newLocation.speed;
    
}

- (void)viewDidUnload {
    [self setSpeedUIView:nil];
    [self setSpeedLabel:nil];
    [super viewDidUnload];
}



- (double)speed
{
    linmspl();
    return _speed;
}

- (void)setSpeed:(double)v
{
    if ( v <= 0.0 )
        v = 0.0;
    _speed += _speed * 0.9 + v;
    _speedLabel.text = [NSString stringWithFormat:@"%i", [[NSNumber numberWithDouble:v] intValue]];
}



- (IBAction)changeTransform:(UITapGestureRecognizer *)sender
{
    linmspl();
 
    if(reverseTransform == false)
    {
        _speedLabel.transform = CGAffineTransformMakeScale(-1,1);
    }
    else
    {
        _speedLabel.transform = CGAffineTransformMakeScale(1,1);
    }
    
    reverseTransform = !reverseTransform;
}

- (IBAction)navigationMode:(id)sender
{
    linmspl();

    NSLog(@"%@", [self.navigationViewController description]);

    
    [self presentViewController:self.navigationViewController animated:YES completion:nil];
//    [self.navigationController presentViewController:self.navigationViewController animated:YES completion:nil];
}
@end
