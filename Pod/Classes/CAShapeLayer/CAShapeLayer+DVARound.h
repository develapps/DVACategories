//
//  CAShapeLayer+DVARound.h
//  liveAppMockup
//
//  Created by Pablo Romeu on 21/5/15.
//  Copyright (c) 2015 Pablo Romeu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CAShapeLayer (DVARound)
+(CAShapeLayer*)dva_roundedLayerWithRect:(CGRect)rect radii:(CGSize)radii andCorners:(UIRectCorner)corners;
@end
