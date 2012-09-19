//
//  HomepwnerAppDelegate.m
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 17..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import "AppDelegate/HomepwnerAppDelegate.h"
#import "View/ItemsViewController.h"
#import "Store/PossessionStore.h"

@implementation HomepwnerAppDelegate

@synthesize window = window_;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ItemsViewController *ivc = [[ItemsViewController alloc] init];
    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:ivc];
    [ivc release];
    
    [[self window] setRootViewController:naviController];
    [naviController release];
    
    [[self window] makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[PossessionStore defaultStore] saveChange];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {}

- (void)applicationDidBecomeActive:(UIApplication *)application {}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[PossessionStore defaultStore] saveChange];
}

@end
