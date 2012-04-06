//
//  MapViewAnnotation.h
//  Walky
//
//  Created by Jinyoung Kim on 3/28/12.
//  Copyright (c) 2012 Walky.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapViewAnnotation : NSObject <MKAnnotation>

@property (copy, nonatomic) NSString *title;
@property (readonly, nonatomic) CLLocationCoordinate2D coordinate;

- (id)initWithTitle:(NSString *)title andCoordinate:(CLLocationCoordinate2D)coordinate;

@end