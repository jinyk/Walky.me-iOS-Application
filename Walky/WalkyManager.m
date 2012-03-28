//
//  WalkyManager.m
//  Walky
//
//  Created by Jinyoung Kim on 2/16/12.
//  Copyright (c) 2012 Walky.me. All rights reserved.
//

#import "WalkyManager.h"

static WalkyManager *sharedWalkyManager = nil;

@implementation WalkyManager

@synthesize location;
@synthesize locationManager;
@synthesize hasDeterminedLocation;

+ (WalkyManager *)sharedManager {
    @synchronized(self) {
        if (sharedWalkyManager == nil) {
            sharedWalkyManager = [[self alloc] init];
        }
    }
    return sharedWalkyManager;
}

- (id)init {
    if (self = [super init]) {
        self.location = nil;
		self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.hasDeterminedLocation = NO;
    }
    return self;
}

- (void)stopLocationManager {
    [self.locationManager stopUpdatingLocation];
    self.hasDeterminedLocation = NO;
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	self.location = newLocation;
    self.hasDeterminedLocation = YES;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"locationManager:didFailWithError: %@", error);
    self.location = nil;
    self.hasDeterminedLocation = YES;
}

@end
