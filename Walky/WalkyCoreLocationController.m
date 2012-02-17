//
//  WalkyCoreLocationController.m
//  Walky
//
//  Created by Jinyoung Kim on 2/15/12.
//  Copyright (c) 2012 Walky.me. All rights reserved.
//

#import "WalkyCoreLocationController.h"

@implementation WalkyCoreLocationController
@synthesize locMgr = _locMgr, delegate = _delegate;

- (id)init {
	self = [super init];

	if(self != nil) {
		self.locMgr = [[CLLocationManager alloc] init];
		self.locMgr.delegate = self;
	}

	return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	if([self.delegate conformsToProtocol:@protocol(WalkyCoreLocationControllerDelegate)]) {
        // Check if the class assigning itself as the delegate conforms to our protocol.  If not, the message will go nowhere.  Not good.
		[self.delegate locationUpdate:newLocation];
	}
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	if([self.delegate conformsToProtocol:@protocol(WalkyCoreLocationControllerDelegate)]) {
        // Check if the class assigning itself as the delegate conforms to our protocol.  If not, the message will go nowhere.  Not good.
		[self.delegate locationError:error];
	}
}

@end
