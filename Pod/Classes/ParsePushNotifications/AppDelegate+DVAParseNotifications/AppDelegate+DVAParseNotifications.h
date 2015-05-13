//
//  AppDelegate+DVAParseNotifications.h
//  AquaService
//
//  Created by Pablo Romeu on 12/5/15.
//  Copyright (c) 2015 Develapps. All rights reserved.
//

#import "AppDelegate.h"
#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

/**
 @author Pablo Romeu, 15-05-12 12:05:02
 
 Debugging const for the category
 
 @since 1.0.0
 */
const BOOL notificationsDebug=NO;

/**
 @author Pablo Romeu, 15-05-12 12:05:39
 
 This category enables AppDelegate to create push notifications connection to Parse. 
 
 At `application:didFinishLaunchingWithOptions:` add
 
    // Pushes
    [self registerPushNotifications];
 
 
 @since 1.0.0
 */
@interface AppDelegate (DVAParseNotifications)

/**
 This method asks for the permissions to register push notifications. You have to call `registeredPushNotifications:` whether this succeeds or not.
 
 @since 1.0.0
 
 @warning before calling this method you should setup Parse
 
    // Parse
 
    [Parse setApplicationId:@"your_id" clientKey:@"your_client_key"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
 
 */
-(void)registerPushNotifications;


@end
