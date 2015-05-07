//
//  GAI+DVALib
//  AquaService
//
//  Created by Pablo Romeu on 4/5/15.
//  Copyright (c) 2015 Develapps. All rights reserved.
//

#import <GoogleAnalytics-iOS-SDK/GAI.h>
#import <GoogleAnalytics-iOS-SDK/GAIDictionaryBuilder.h>
#import <GoogleAnalytics-iOS-SDK/GAIFields.h>

/**
 Class extension to manage Google Analytics platform
 
 @since 1.0.1
 */
@interface GAI (DVALib)

/**
 Send an app open
 
 @param trackingId the App track id
 
 @since 1.0.1
 */
+(void)dva_sendAppOpen:(NSString*)trackingId;
/**
 Sends an App Screen name view
 
 @param screenName the name of the screen
 @warning any event sent after this method will be associated with this screen
 @since 1.0.1
 */
+(void)dva_sendScreen:(NSString *)screenName;
/**
 Sends an event for the current screen
 
 @param event       the event name
 @param categoty    The category of the event
 @since 1.0.1
 */
+(void)dva_sendEvent:(NSString *)event forCategory:(NSString*)category;

/**
 Sends an event for the current screen and using a category and maybe a label and/or value
 
 @param event    the event
 @param category the category
 @param label    the label
 @param value    the value
 
 @since 1.0.1
 */
+(void)dva_sendEvent:(NSString *)event forCategory:(NSString*)category withLabel:(NSString*)label andValue:(NSNumber*)value;

/**
 Sends an event with a social network
 
 @param event   the event
 @param network the social network
 @param target  the target
 
 @since 1.0.1
 */
+(void)dva_sendSocialEvent:(NSString *)event withNetwork:(NSString*)network target:(NSString*)target;

/**
 Starts a timing for an event
 
 @param category the category of the event (mandatory)
 @param name     the name (optional)
 @param label    the label (optional)
 
 @since 1.0.1
 */
+(void)dva_startTimmingForCategory:(NSString*)category andName:(NSString*)name andLabel:(NSString*)label;
/**
 Sends a timing for an event.
 
 @param category the category of the event (mandatory)
 @param name     the name (optional)
 @param label    the label (optional)
 
 @warning  You must have started a timmer before calling this method or nothing will occur
 @since 1.0.1
 */
+(void)dva_sendTimmingForCategory:(NSString*)category andName:(NSString*)name andLabel:(NSString*)label;
@end
