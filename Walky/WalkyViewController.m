//
//  WalkyFirstViewController.m
//  Walky
//
//  Created by Jinyoung Kim on 2/14/12.
//  Copyright (c) 2012 Walky.me. All rights reserved.
//

#import "WalkyViewController.h"
#import "WalkyManager.h"
#import "SVProgressHUD.h"
#import "MapViewAnnotation.h"

@implementation WalkyViewController

@synthesize mapView;

#pragma mark - Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    [self setMapView:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.mapView setShowsUserLocation:YES];
    [self locateMe:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - actions

- (void)updateMapCenter:(CLLocation *)location {
    [self.mapView setRegion:MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05))];    
}

- (IBAction)locateMe:(id)sender {
    [SVProgressHUD showWithStatus:@"locating you..."];
    WalkyManager *sharedManager = [WalkyManager sharedManager];
    [sharedManager.locationManager startUpdatingLocation];
    if (!sharedManager.hasDeterminedLocation) {
        [SVProgressHUD showWithStatus:@"locating you..."];
        [self performSelector:@selector(locateMe:) withObject:sender afterDelay:1];
    } else {
        [sharedManager stopLocationManager];
        [SVProgressHUD dismiss];
        if (sharedManager.location != nil) {
            [self updateMapCenter:sharedManager.location];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Could not detect location."
                                                            message:@"Center on another city?"
                                                           delegate:self
                                                  cancelButtonTitle:@"Dismiss"
                                                  otherButtonTitles:@"New York City", @"Philadelphia", @"Seoul", nil];
            [alert show];
        }
    }
}

- (IBAction)giveFeedback:(id)sender {
    [TestFlight openFeedbackView];
}

- (IBAction)addMarker:(UILongPressGestureRecognizer *)sender {
    CGPoint touchPoint = [sender locationInView:self.mapView];
    CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            {
                MapViewAnnotation *newAnnotation = [[MapViewAnnotation alloc] initWithTitle:@"new location" andCoordinate:touchMapCoordinate];
                [self.mapView addAnnotation:newAnnotation];
                NSLog(@"Began at: %f,%f", touchMapCoordinate.latitude, touchMapCoordinate.longitude);
                break;
            }
        case UIGestureRecognizerStateEnded:
            {
                NSLog(@"Ended at: %f,%f", touchMapCoordinate.latitude, touchMapCoordinate.longitude);
                break;
            }
        default:
            break;
    }
}

#pragma mark - Location Related

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 1:
            [self updateMapCenter:[[CLLocation alloc] initWithLatitude:40.7391 longitude:-73.9907]];
            break;
        case 2:
            [self updateMapCenter:[[CLLocation alloc] initWithLatitude:39.9523 longitude:-75.1629]];
            break;
        case 3:
            [self updateMapCenter:[[CLLocation alloc] initWithLatitude:37.5664 longitude:126.9780]];
            break;
        default:
            break;
    }
}

@end
