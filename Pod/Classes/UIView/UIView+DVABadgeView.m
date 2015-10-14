//
//  UIView+DVABadgeView.m
//  MyBae
//
//  Created by Pablo Romeu on 29/7/15.
//  Copyright (c) 2015 Mybæ. All rights reserved.
//

#import "UIView+DVABadgeView.h"


@implementation UIView (DVABadgeView)

- (void)dva_addBadgeView:(UIView*)badgeView{
    [self dva_addBadgeView:badgeView andPosition:DVABadgeViewTopLeft andOffset:UIOffsetZero];
}

- (void)dva_addBadgeView:(UIView*)badgeView andPosition:(DVABadgeViewPosition)position andOffset:(UIOffset)offset{
    [self addSubview:badgeView];
    
    NSLayoutAttribute firstSelf;
    NSLayoutAttribute secondSelf;
    
    switch (position) {
        case DVABadgeViewTopLeft:
            firstSelf=NSLayoutAttributeLeading;
            secondSelf=NSLayoutAttributeTop;
            break;
        case DVABadgeViewBottomLeft:
            firstSelf=NSLayoutAttributeLeading;
            secondSelf=NSLayoutAttributeBottom;
            break;
        case DVABadgeViewTopRight:
            firstSelf=NSLayoutAttributeTrailing;
            secondSelf=NSLayoutAttributeTop;
            break;
        case DVABadgeViewBottomRight:
            firstSelf=NSLayoutAttributeTrailing;
            secondSelf=NSLayoutAttributeBottom;
            break;
            
        default:
            break;
    }
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:firstSelf relatedBy:NSLayoutRelationEqual toItem:badgeView attribute:NSLayoutAttributeCenterX multiplier:1 constant:offset.horizontal]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:secondSelf relatedBy:NSLayoutRelationEqual toItem:badgeView attribute:NSLayoutAttributeCenterY multiplier:1 constant:offset.vertical]];

}

@end
