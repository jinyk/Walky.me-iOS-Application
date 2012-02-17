//
//  WalkyFirstViewController.h
//  Walky
//
//  Created by Jinyoung Kim on 2/14/12.
//  Copyright (c) 2012 Walky.me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface WalkyFirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *nearByMap;

- (IBAction)locateMeButton:(id)sender;

@end
