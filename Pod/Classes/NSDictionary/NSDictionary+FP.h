//
//  NSDictionary+FP.h
//  MyBae
//
//  Created by Pablo Salvá on 22/07/15.
//  Copyright (c) 2015 Mybæ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (FP)

- (NSDictionary *)dva_filterNullValues;
- (NSDictionary *)dva_filterWithPredicate:(NSPredicate *)predicate;

@end
