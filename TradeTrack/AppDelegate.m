//
//  AppDelegate.m
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/24/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    UIColor * gray = [UIColor colorWithRed:210/255.0 green:210.0/255.0 blue:210.0/255.0 alpha:1.0];
    [[UIToolbar appearance] setBackgroundImage:[UIImage imageNamed:@"menubar-7"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UIToolbar appearance] setTintColor:gray];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"menubar-7"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:gray, NSForegroundColorAttributeName, nil]];
    [[UINavigationBar appearance] setTintColor:gray];
    
    // Initial local Core Data
    [MagicalRecord setupCoreDataStack];
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [MagicalRecord cleanUp];
}

@end
