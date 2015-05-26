//
//  CAShapeLayer+DVADashedBorder.m
//  liveAppMockup
//
//  Created by Pablo Romeu on 21/5/15.
//  Copyright (c) 2015 Pablo Romeu. All rights reserved.
//

#import "CAShapeLayer+DVADashedBorder.h"

@implementation CAShapeLayer (DVADashedBorder)
+(CAShapeLayer*)dva_setupDashedBorderWithSize:(CGSize)rect
                              length:(CGFloat)line
                            andWidth:(CGFloat)width
                            andSpace:(CGFloat)space
                            andColor:(UIColor*)color
                     andCornerRadius:(CGFloat)radius
                            animated:(BOOL)animated{
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    CGSize frameSize = rect;
    
    CGRect shapeRect = CGRectMake(0.0f, 0.0f, frameSize.width, frameSize.height);
    [shapeLayer setBounds:shapeRect];
    [shapeLayer setPosition:CGPointMake( frameSize.width/2,frameSize.height/2)];
    
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    [shapeLayer setStrokeColor:color.CGColor];
    [shapeLayer setLineWidth:width];
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:@(line),@(space),
      nil]];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:shapeRect cornerRadius:radius];
    [shapeLayer setPath:path.CGPath];
    
    if (animated) {
        if ([shapeLayer animationForKey:@"linePhase"])
            [shapeLayer removeAnimationForKey:@"linePhase"];
        else {
            CABasicAnimation *dashAnimation;
            dashAnimation = [CABasicAnimation
                             animationWithKeyPath:@"lineDashPhase"];
            
            [dashAnimation setFromValue:[NSNumber numberWithFloat:0.0f]];
            [dashAnimation setToValue:[NSNumber numberWithFloat:line+space]];
            [dashAnimation setDuration:1.0f];
            [dashAnimation setRepeatCount:HUGE];
            
            [shapeLayer addAnimation:dashAnimation forKey:@"linePhase"];
            
        }
    }
    return shapeLayer;
}
@end
