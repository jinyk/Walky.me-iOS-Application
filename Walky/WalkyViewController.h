//
//  WalkyFirstViewController.h
//  Walky
//
//  Created by Jinyoung Kim on 2/14/12.
//  Copyright (c) 2012 Walky.me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface WalkyViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)locateMe:(id)sender;
- (IBAction)giveFeedback:(id)sender;
- (IBAction)addMarker:(UILongPressGestureRecognizer *)sender;

@end
