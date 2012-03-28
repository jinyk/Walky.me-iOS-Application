//
//  WalkyManager.h
//  Walky
//
//  Created by Jinyoung Kim on 2/16/12.
//  Copyright (c) 2012 Walky.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface WalkyManager : NSObject <CLLocationManagerDelegate>

@property BOOL hasDeterminedLocation;
@property (strong, nonatomic) CLLocation *location;
@property (strong, nonatomic) CLLocationManager *locationManager;

+ (WalkyManager *)sharedManager;
- (void)stopLocationManager;

@end