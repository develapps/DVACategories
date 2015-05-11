//
//  UIColor+DVAHex
//  Develapps
//
//  Created by Pablo on 01/12/14.
//  Copyright (c) 2014 Develapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DVAHex)
/**
 @author Pablo Romeu, 15-05-11 18:05:49
 
 This is a helper for UIColor to get a color with hex value
 
 @param rgbValue an hex value
 
 @return a UIColor
 
 @since 1.0.1
 */
+ (UIColor *)dva_colorWithHex:(NSInteger)rgbValue;

@end
