//
//  CAShapeLayer+DVADashedBorder.h
//  liveAppMockup
//
//  Created by Pablo Romeu on 21/5/15.
//  Copyright (c) 2015 Pablo Romeu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CAShapeLayer (DVADashedBorder)
+(CAShapeLayer*)dva_setupDashedBorderWithSize:(CGSize)rect
                              length:(CGFloat)line
                            andWidth:(CGFloat)width
                            andSpace:(CGFloat)space
                            andColor:(UIColor*)color
                     andCornerRadius:(CGFloat)radius
                            animated:(BOOL)animated;
@end
