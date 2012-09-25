#import "AppDelegate/HomepwnerAppDelegate.h"
#import "Store/PossessionStore.h"
#import "View/ItemsViewController.h"

@implementation HomepwnerAppDelegate

@synthesize window = window_;

- (BOOL)application:(UIApplication *)application
        didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
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
