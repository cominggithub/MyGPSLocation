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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    linmspl();
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    linmspl();
    [super viewDidLoad];
	// Do any additional setup after loading the view.
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// orientation for ios6
- (BOOL) shouldAutorotate
{
    linmspl();
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    linmspl();
    return UIInterfaceOrientationMaskLandscapeLeft;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    linmspl();
    return UIInterfaceOrientationLandscapeLeft;
}
// end of orientation for ios 6

// orientation for ios 5 or earier

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    linmspl();
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}
// end of orientation for ios5 or earier

@end
