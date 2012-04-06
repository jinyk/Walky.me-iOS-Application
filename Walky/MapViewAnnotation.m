//
//  MapViewAnnotation.m
//  Walky
//
//  Created by Jinyoung Kim on 3/28/12.
//  Copyright (c) 2012 Walky.me. All rights reserved.
//

#import "MapViewAnnotation.h"

@implementation MapViewAnnotation

@synthesize title = _title;
@synthesize coordinate = _coordinate;

- (id)initWithTitle:(NSString *)title andCoordinate:(CLLocationCoordinate2D)coordinate {
	self = [super init];
	_title = title;
	_coordinate = coordinate;
	return self;
}

@end
