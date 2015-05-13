//
//  AppDelegate+DVAParseNotifications.m
//  AquaService
//
//  Created by Pablo Romeu on 12/5/15.
//  Copyright (c) 2015 Develapps. All rights reserved.
//

#import "AppDelegate+DVAParseNotifications.h"

@implementation AppDelegate (DVAParseNotifications)
#pragma mark - Remote notifications AppDelegate methods


- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings{
    [self registeredUserNotificationSettings:notificationSettings];
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [self registeredPushNotifications:deviceToken andError:nil];
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    [self registeredPushNotifications:nil andError:error];
}


#pragma mark - Register remote notifications

-(void)registerPushNotifications{
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationSettings* notificationSettings = [[UIApplication sharedApplication] currentUserNotificationSettings];
        UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                        UIUserNotificationTypeBadge |
                                                        UIUserNotificationTypeSound);
        if (notificationSettings.types!=userNotificationTypes){
            if (notificationsDebug) NSLog(@"%@: PUSH: Asking for permission iOS 8 or later: %lu",[self.class description],(unsigned long)userNotificationTypes);
            UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                                                                     categories:nil];
            [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        }
        else
        {
            [self registerPushNotificationsOniOS8];
        }
    }
    else
    {
        UIRemoteNotificationType userNotificationTypes = (UIRemoteNotificationTypeBadge |
                                                          UIRemoteNotificationTypeAlert |
                                                          UIRemoteNotificationTypeSound);
        if (notificationsDebug) NSLog(@"%@: PUSH: Asking for permission iOS 7: %lu",[self.class description],(unsigned long)userNotificationTypes);
        
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:userNotificationTypes];
    }
}

-(void)registeredUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings{
    if (notificationsDebug) NSLog(@"%@: PUSH: Registered user notifications, asking for remote",[self.class description]);
    [self registerPushNotificationsOniOS8];
}

-(void)registerPushNotificationsOniOS8{
    if (notificationsDebug) NSLog(@"%@: PUSH: Asking for remote notification in iOS 8 or later",[self.class description]);
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}

-(void)registeredPushNotifications:(NSData *)deviceToken andError:(NSError *)error{
    if (!error) {
        if (notificationsDebug) NSLog(@"%@: PUSH: Registered remote notifications",[self.class description]);
        // Store the deviceToken in the current installation and save it to Parse.
        PFInstallation *currentInstallation = [PFInstallation currentInstallation];
        [currentInstallation setDeviceTokenFromData:deviceToken];
        [currentInstallation saveEventually];
    }
    else{
        if (notificationsDebug) NSLog(@"%@: PUSH: Register remote notifications failed %@",[self.class description],error);
    }
}





@end
