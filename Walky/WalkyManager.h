//
//  WalkyManager.h
//  Walky
//
//  Created by Jinyoung Kim on 2/16/12.
//  Copyright (c) 2012 Walky.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WalkyCoreLocationController.h"

@interface WalkyManager : NSObject <WalkyCoreLocationControllerDelegate>

@property (strong, nonatomic) WalkyCoreLocationController *CLController;
@property (strong, nonatomic) CLLocation *location;

+ (id)sharedManager;

@end