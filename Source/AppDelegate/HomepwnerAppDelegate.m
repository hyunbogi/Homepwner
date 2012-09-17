//
//  HomepwnerAppDelegate.m
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 17..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import "AppDelegate/HomepwnerAppDelegate.h"
#import "View/ItemsViewController.h"

@implementation HomepwnerAppDelegate

@synthesize window = window_;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ItemsViewController *ivc = [[ItemsViewController alloc] init];
    
    [[self window] setRootViewController:ivc];
    [ivc release];

    [[self window] makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {}

- (void)applicationDidEnterBackground:(UIApplication *)application {}

- (void)applicationWillEnterForeground:(UIApplication *)application {}

- (void)applicationDidBecomeActive:(UIApplication *)application {}

- (void)applicationWillTerminate:(UIApplication *)application {}

@end
