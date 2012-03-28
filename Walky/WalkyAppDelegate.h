//
//  WalkyAppDelegate.h
//  Walky
//
//  Created by Jinyoung Kim on 2/14/12.
//  Copyright (c) 2012 Walky.me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WalkyManager.h"

@interface WalkyAppDelegate : UIResponder <UIApplicationDelegate> {
    WalkyManager *_sharedManager;
}

@property (strong, nonatomic) UIWindow *window;

@end
