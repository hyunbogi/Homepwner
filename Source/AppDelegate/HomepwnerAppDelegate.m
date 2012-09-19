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
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    ItemsViewController *ivc = [[ItemsViewController alloc] init];
    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:ivc];
    [ivc release];
    
    [[self window] setRootViewController:naviController];
    [naviController release];
    
    [[self window] makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [[PossessionStore defaultStore] saveChange];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [[PossessionStore defaultStore] saveChange];
}

@end
