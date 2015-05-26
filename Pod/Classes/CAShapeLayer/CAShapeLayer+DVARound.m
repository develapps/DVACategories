//
//  CAShapeLayer+DVARound.m
//  liveAppMockup
//
//  Created by Pablo Romeu on 21/5/15.
//  Copyright (c) 2015 Pablo Romeu. All rights reserved.
//

#import "CAShapeLayer+DVARound.h"

@implementation CAShapeLayer (DVARound)
+(CAShapeLayer*)dva_roundedLayerWithRect:(CGRect)rect radii:(CGSize)radii andCorners:(UIRectCorner)corners{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    maskLayer.bounds = rect;
    maskLayer.path = maskPath.CGPath;
    maskLayer.anchorPoint = CGPointZero;
    return maskLayer;
}



@end
