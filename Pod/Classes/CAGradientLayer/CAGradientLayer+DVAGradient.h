//
//  CAGradientLayer+DVAGradient.h
//  liveAppMockup
//
//  Created by Pablo Romeu on 21/5/15.
//  Copyright (c) 2015 Pablo Romeu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    kDVAGradientAnimationNone=0,
    kDVAGradientAnimationReverse=1,
    kDVAGradientAnimationApply=2,
} DVAGradientAnimation;

/**
 This intends to easily create a gradient layer.
 
 @version 1.2.0
 */
@interface CAGradientLayer (DVAGradient)
/**
 @author Pablo Romeu, 15-05-26 16:05:34
 
 Creates a gradient layer with some parameters
 
 @param rect      the rect
 @param initColor the initial color
 @param endColor  the end color
 @param initPoint the init point
 @param endPoint  the end point
 
 @return a gradient layer
 
 @since 1.2.0
 */
+(CAGradientLayer*)dva_gradientWithRect:(CGRect)rect
                              colorInit:(UIColor*)initColor
                               colorEnd:(UIColor*)endColor
                              initPoint:(CGPoint)initPoint
                               endPoint:(CGPoint)endPoint;
/**
 @author Pablo Romeu, 15-05-27 13:05:33
 
 Creates a gradient layer with some parameters and maybe an animation
 
 @param rect      the rect
 @param initColor the initial color
 @param endColor  the end color
 @param initPoint the init point
 @param endPoint  the end point
 @param animation the animation type
 
 @return a gradient layer
 
 @since 1.2.0
 */
+(CAGradientLayer*)dva_gradientWithRect:(CGRect)rect
                              colorInit:(UIColor*)initColor
                               colorEnd:(UIColor*)endColor
                              initPoint:(CGPoint)initPoint
                               endPoint:(CGPoint)endPoint
                              animation:(DVAGradientAnimation)animation;
@end
