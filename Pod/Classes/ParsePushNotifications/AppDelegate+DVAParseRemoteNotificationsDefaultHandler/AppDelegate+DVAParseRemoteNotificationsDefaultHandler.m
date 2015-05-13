//
//  AppDelegate+DVAParseRemoteNotificationsDefaultHandler
//  AquaService
//
//  Created by Pablo Romeu on 12/5/15.
//  Copyright (c) 2015 Develapps. All rights reserved.
//

#import "AppDelegate+DVAParseRemoteNotificationsDefaultHandler.h"

@implementation AppDelegate (DVAParseRemoteNotificationsDefaultHandler)


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [self remoteNotificationReceived:userInfo];
}
#pragma mark - Handle remote notifications

-(void)remoteNotificationReceived:(NSDictionary *)userInfo{
    if (userInfo[UIApplicationLaunchOptionsRemoteNotificationKey]) {
        if (remoteNotificationsHandlerDebug) NSLog(@"%@: PUSH: Remote notification received",[self.class description]);
        [PFPush handlePush:userInfo];
    }
}

@end
