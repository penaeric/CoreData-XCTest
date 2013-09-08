//
//  AppDelegate.m
//  CoreDataXCTest
//
//  Created by Eric Pena on 9/7/13.
//
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [MagicalRecord setupCoreDataStack];
    
    return YES;
}

@end
