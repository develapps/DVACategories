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

+(CAGradientLayer*)dva_gradientWithRect:(CGRect)rect
                              colorInit:(UIColor*)initColor
                               colorEnd:(UIColor*)endColor
                              initPoint:(CGPoint)initPoint
                               endPoint:(CGPoint)endPoint
                              animation:(DVAGradientAnimation)animation{
    CAGradientLayer *gradient = [CAGradientLayer dva_gradientWithRect:rect colorInit:initColor colorEnd:endColor initPoint:initPoint endPoint:endPoint];
    
    switch (animation) {
        case kDVAGradientAnimationNone:
            break;
        case kDVAGradientAnimationReverse:
            if ([gradient animationForKey:@"gradientPhase"])
                [gradient removeAnimationForKey:@"gradientPhase"];
            else {
                CABasicAnimation *dashAnimation;
                dashAnimation = [CABasicAnimation
                                 animationWithKeyPath:@"colors"];
                [dashAnimation setFromValue:@[(id)[initColor CGColor], (id)[endColor CGColor]]];
                [dashAnimation setToValue:@[(id)[endColor CGColor], (id)[initColor CGColor]]];
                [dashAnimation setDuration:1.0f];
                [dashAnimation setAutoreverses:YES];
                [dashAnimation setRepeatCount:HUGE];
                
                [gradient addAnimation:dashAnimation forKey:@"gradientPhase"];
            }
            break;
        case kDVAGradientAnimationApply:
            if ([gradient animationForKey:@"gradientPhase"])
                [gradient removeAnimationForKey:@"gradientPhase"];
            else {
                CABasicAnimation *dashAnimation;
                dashAnimation = [CABasicAnimation
                                 animationWithKeyPath:@"endPoint"];
                [dashAnimation setFromValue:[NSValue valueWithCGPoint:initPoint]];
                [dashAnimation setToValue:[NSValue valueWithCGPoint:endPoint]];
                [dashAnimation setDuration:1.0f];
                [dashAnimation setAutoreverses:YES];
                [dashAnimation setRepeatCount:HUGE];
                
                [gradient addAnimation:dashAnimation forKey:@"gradientPhase"];
            }
            break;
        default:
            break;
    }
    
    return gradient;
}

@end
