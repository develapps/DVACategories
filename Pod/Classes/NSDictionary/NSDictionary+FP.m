//
//  NSDictionary+FP.m
//  MyBae
//
//  Created by Pablo Salvá on 22/07/15.
//  Copyright (c) 2015 Mybæ. All rights reserved.
//

#import "NSDictionary+FP.h"

@implementation NSDictionary (FP)

- (NSDictionary *)dva_filterNullValues {
    NSPredicate *nilPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return ![evaluatedObject isKindOfClass:[NSNull class]];
    }];
    return [self dva_filterWithPredicate:nilPredicate];
}

- (NSDictionary *)dva_filterWithPredicate:(NSPredicate *)predicate {
    NSArray *keys = [self allKeys];
    NSMutableDictionary *newDictionary = [NSMutableDictionary new];
    [keys enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop) {
        id value = self[key];
        if ([predicate evaluateWithObject:value]) {
            [newDictionary setObject:value forKey:key];
        }
    }];
    return [newDictionary copy];
}

@end
