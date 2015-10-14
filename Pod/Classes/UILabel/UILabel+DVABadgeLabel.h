//
//  UILabel+DVABadgeLabel.h
//  MyBae
//
//  Created by Pablo Romeu on 25/8/15.
//  Copyright (c) 2015 Mybæ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+DVABadgeView.h"

@interface UILabel (DVABadgeLabel)
- (void)dva_addBadgeLabelToView:(UIView*)theView andPosition:(DVABadgeViewPosition)position andOffset:(UIOffset)offset;
-(void)dva_setBadgeValue:(NSInteger)value animated:(BOOL)animated;
@end
