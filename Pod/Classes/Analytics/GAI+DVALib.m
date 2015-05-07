//
//  GAI+DVALib
//  AquaService
//
//  Created by Pablo Romeu on 4/5/15.
//  Copyright (c) 2015 Develapps. All rights reserved.
//

#import "GAI+DVALib.h"
#import <objc/runtime.h>

@interface GAI ()
@property (strong, nonatomic) NSMutableDictionary*timmings;
@end

@implementation GAI (DVALibs)

#pragma mark - Send events

+(void)dva_sendAppOpen:(NSString*)trackingId{
    id <GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:trackingId];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

+(void)dva_sendScreen:(NSString *)screenName{
    [[GAI sharedInstance].defaultTracker set:kGAIScreenName
                                       value:screenName];
    [[GAI sharedInstance].defaultTracker
     send:[[GAIDictionaryBuilder createScreenView] build]];
}

+(void)dva_sendEvent:(NSString *)event forCategory:(NSString*)category{
    [GAI dva_sendEvent:event forCategory:category withLabel:nil andValue:nil];
}

+(void)dva_sendEvent:(NSString *)event forCategory:(NSString*)category withLabel:(NSString*)label andValue:(NSNumber*)value{
    
    if (label!=nil && value!=nil) {
        [[[GAI sharedInstance] defaultTracker]
         send:[[GAIDictionaryBuilder createEventWithCategory:category
                                                      action:event
                                                       label:label
                                                       value:value] build]];
    }
    else if (label!=nil) {
        [[[GAI sharedInstance] defaultTracker]
         send:[[GAIDictionaryBuilder createEventWithCategory:category
                                                      action:event
                                                       label:label
                                                       value:nil] build]];
    }
    else if (value!=nil) {
        [[[GAI sharedInstance] defaultTracker]
         send:[[GAIDictionaryBuilder createEventWithCategory:category
                                                      action:event
                                                       label:nil
                                                       value:value] build]];
    }
    else if (label==nil && value==nil){
        [[[GAI sharedInstance] defaultTracker]
         send:[[GAIDictionaryBuilder createEventWithCategory:category
                                                      action:event
                                                       label:nil
                                                       value:nil] build]];

    }

}

+(void)dva_sendSocialEvent:(NSString *)event withNetwork:(NSString*)network target:(NSString*)target{
    if (target) {
        [[[GAI sharedInstance] defaultTracker]
         send:[[GAIDictionaryBuilder createSocialWithNetwork:network
                                                             action:event
                                                             target:target] build]];
    }
    else {
        [[[GAI sharedInstance] defaultTracker]
         send:[[GAIDictionaryBuilder createSocialWithNetwork:network
                                                      action:event
                                                      target:nil] build]];
    }

}

#pragma mark - timmings

- (NSMutableDictionary *)timmings {
    return objc_getAssociatedObject(self, @selector(timmings));
}

- (void)setTimmings:(NSMutableDictionary *)timmings{
    objc_setAssociatedObject(self, @selector(timmings), timmings, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


+(NSString*)timmingIdentifier:(NSString*)category andName:(NSString*)name andLabel:(NSString*)label{
    NSString*identifier;
    if (!category) {
        return nil;
    }
    else if (name && label){
        identifier=[NSString stringWithFormat:@"%@-%@-%@",category,name,label];
    }
    else if (name){
        identifier=[NSString stringWithFormat:@"%@-%@",category,name];
    }
    else if (label){
        identifier=[NSString stringWithFormat:@"%@--%@",category,label];
    }
    else {
        identifier=[NSString stringWithFormat:@"%@",category];
    }
    return identifier;
}

+(void)dva_startTimmingForCategory:(NSString*)category andName:(NSString*)name andLabel:(NSString*)label{
    NSString*identifier=[GAI timmingIdentifier:category andName:name andLabel:label];
    [[[GAI sharedInstance] logger] info:[NSString stringWithFormat:@"INFO - (%@,%s): Starting timming for %@",[self class],__PRETTY_FUNCTION__,identifier]];
    if (!identifier) return;
    NSMutableDictionary*timmings=[GAI sharedInstance].timmings;
    if (!timmings) {
        [GAI sharedInstance].timmings=[NSMutableDictionary new];
        timmings=[GAI sharedInstance].timmings;
    }
    
    [timmings setObject:[NSDate date] forKey:identifier];
    
}

+(void)dva_sendTimmingForCategory:(NSString*)category andName:(NSString*)name andLabel:(NSString*)label{
    NSString*identifier=[GAI timmingIdentifier:category andName:name andLabel:label];
    if (!identifier) return;
    NSDate*date=[[GAI sharedInstance].timmings objectForKey:identifier];
    if (!date) {
        return;
    }
    NSTimeInterval interval = -[date timeIntervalSinceNow];
    [[[GAI sharedInstance] logger] info:[NSString stringWithFormat:@"INFO - (%@,%s): Sending timming (%f) for %@",[self class],__PRETTY_FUNCTION__,interval,identifier]];

    id tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send: [[GAIDictionaryBuilder createTimingWithCategory:category
                                                          interval:@(interval)
                                                              name:name
                                                             label:label] build]];

}

@end
