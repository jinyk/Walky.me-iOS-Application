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

@synthesize CLController = _CLController;
@synthesize location = _location;

+ (id)sharedManager {
    @synchronized(self) {
        if (sharedWalkyManager == nil) {
            sharedWalkyManager = [[self alloc] init];
        }
    }
    return sharedWalkyManager;
}

- (id)init {
    if (self = [super init]) {
        NSLog(@"Manager Init");
        self.location = nil;
        self.CLController = [[WalkyCoreLocationController alloc] init];
        self.CLController.delegate = self;
        [self.CLController.locMgr startUpdatingLocation];
    }
    return self;
}

- (void)locationUpdate:(CLLocation *)location {
    self.location = location;
    NSLog(@"Got me a location update.");
}

- (void)locationError:(NSError *)error {
	self.location = nil;
}

@end
