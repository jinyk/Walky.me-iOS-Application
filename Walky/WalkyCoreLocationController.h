//
//  WalkyCoreLocationController.h
//  Walky
//
//  Created by Jinyoung Kim on 2/15/12.
//  Copyright (c) 2012 Walky.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol WalkyCoreLocationControllerDelegate 
@required
- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;
@end

@interface WalkyCoreLocationController : NSObject <CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locMgr;
@property (nonatomic, strong) id delegate;
@end
