//
//  UIColor+DVAHex
//  Develapps
//
//  Created by Pablo on 01/12/14.
//  Copyright (c) 2014 Develapps. All rights reserved.
//

#import "UIColor+DVAHex.h"

@implementation UIColor (DVAHex)

+ (UIColor *)dva_colorWithHex:(NSInteger)rgbValue
{
    UIColor *color = [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];    
    return color;
}

@end
