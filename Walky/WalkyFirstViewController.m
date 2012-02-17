//
//  WalkyFirstViewController.m
//  Walky
//
//  Created by Jinyoung Kim on 2/14/12.
//  Copyright (c) 2012 Walky.me. All rights reserved.
//

#import "WalkyFirstViewController.h"
#import "WalkyManager.h"

@implementation WalkyFirstViewController

@synthesize nearByMap;

#pragma mark - Location Related

- (void) updateMapCenter:(CLLocation *)location {
    CLLocationCoordinate2D nycLatLng = location.coordinate;
    MKCoordinateSpan nycSpan = MKCoordinateSpanMake(0.05, 0.05);
    [nearByMap setRegion:MKCoordinateRegionMake(nycLatLng, nycSpan)];    
}

- (IBAction)locateMeButton:(id)sender {
    WalkyManager *sharedManager = [WalkyManager sharedManager];
    if (sharedManager.location != nil) {
        [self updateMapCenter:sharedManager.location];
    }
}

#pragma mark - Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"First View loaded");
    WalkyManager *sharedManager = [WalkyManager sharedManager];
    if (sharedManager.location != nil) {
        [self updateMapCenter:sharedManager.location];
    }
}

- (void)viewDidUnload {
    [self setNearByMap:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
