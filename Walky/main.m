//
//  main.m
//  Walky
//
//  Created by Jinyoung Kim on 2/14/12.
//  Copyright (c) 2012 Walky.me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WalkyAppDelegate.h"
#import "WalkyManager.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        WalkyManager *sharedManager = [WalkyManager sharedManager];

        return UIApplicationMain(argc, argv, nil, NSStringFromClass([WalkyAppDelegate class]));
    }
}
