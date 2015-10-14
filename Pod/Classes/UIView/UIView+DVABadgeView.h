//
//  UIView+DVABadgeView.h
//  MyBae
//
//  Created by Pablo Romeu on 29/7/15.
//  Copyright (c) 2015 Mybæ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    DVABadgeViewTopLeft,
    DVABadgeViewTopRight,
    DVABadgeViewBottomRight,
    DVABadgeViewBottomLeft,
} DVABadgeViewPosition;

@interface UIView (DVABadgeView)
- (void)dva_addBadgeView:(UIView*)badgeView;
- (void)dva_addBadgeView:(UIView*)badgeView andPosition:(DVABadgeViewPosition)position andOffset:(UIOffset)offset;

@end
