//
//  CAGradientLayer+DVAGradient.m
//  liveAppMockup
//
//  Created by Pablo Romeu on 21/5/15.
//  Copyright (c) 2015 Pablo Romeu. All rights reserved.
//

#import "CAGradientLayer+DVAGradient.h"

@implementation CAGradientLayer (DVAGradient)
+(CAGradientLayer*)dva_gradientWithRect:(CGRect)rect
                              colorInit:(UIColor*)initColor
                               colorEnd:(UIColor*)endColor
                              initPoint:(CGPoint)initPoint
                               endPoint:(CGPoint)endPoint{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = rect;
    gradient.colors = [NSArray arrayWithObjects:(id)[initColor CGColor], (id)[endColor CGColor], nil];
    gradient.startPoint = initPoint;
    gradient.endPoint = endPoint;
    return gradient;
}
@end
