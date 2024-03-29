//
//  NavigationViewController.m
//  MyGPSLocation
//
//  Created by Coming on 12/12/23.
//  Copyright (c) 2012年 Coming. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

@synthesize SpeedUIView=_SpeedUIView;
@synthesize NavigationUIView=_NavigationUIView;
@synthesize SpeedLabel=_SpeedLabel;
@synthesize SpeedUnitLabel=_SpeedUnitLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    linmspl();
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    
    return self;
}

- (id) init
{
    if (self = [super init])
    {
        navigationEngine = (NavigationEngine*)[[NavigationEngine alloc] init];
        
        [navigationEngine registerNavigationEngineSpeedChangeEvent:self];
    }
    
    return self;
}
- (void)viewDidLoad
{
    linmspl();
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
        
}

- (void)viewDidAppear:(BOOL)animated
{
   

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// orientation for ios6
- (BOOL) shouldAutorotate
{

    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{

    return UIInterfaceOrientationMaskLandscapeLeft;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{

    return UIInterfaceOrientationLandscapeLeft;
}
// end of orientation for ios 6

// orientation for ios 5 or earier

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{

    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}
// end of orientation for ios5 or earier

- (IBAction)SwitchBackToMainMenu:(id)sender {
    linmspl();
    [self dismissViewControllerAnimated:YES completion:nil];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
}
- (void)viewDidUnload {
    [self setSpeedUIView:nil];
    [self setNavigationUIView:nil];
    [self setSpeedLabel:nil];
    [self setSpeedUnitLabel:nil];
    [super viewDidUnload];
}

-(void)updateKMHSpeed:(double)speed
{
    if (distanceUnit == METER)
    {
        self.SpeedLabel.text = [NSString stringWithFormat:@"%.0f", speed];
        self.SpeedUnitLabel.text = @"km/h";
    }
}

-(void)updateMHSpeed:(double)speed
{
    if (distanceUnit == MILE)
    {
        self.SpeedLabel.text = [NSString stringWithFormat:@"%.0f", speed];
        self.SpeedUnitLabel.text = @"mph";
    }
}


@end
