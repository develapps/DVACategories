//
//  UILabel+DVABadgeLabel.h
//  MyBae
//
//  Created by Pablo Romeu on 25/8/15.
//  Copyright (c) 2015 Mybæ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+DVABadgeView.h"

@interface DVABadgeLabelConfigurator : NSObject
@property (nonatomic)   DVABadgeViewPosition position;
@property (nonatomic)   UIOffset offset;
@property (nonatomic,strong)    UIColor *backgroundColor;
@property (nonatomic,strong)    UIColor *textColor;
@end

@interface UILabel (DVABadgeLabel)
- (void)dva_addBadgeLabelToView:(UIView*)theView usingConfigurator:(DVABadgeLabelConfigurator*)configurator;
- (void)dva_addBadgeLabelToView:(UIView*)theView andPosition:(DVABadgeViewPosition)position andOffset:(UIOffset)offset;
-(void)dva_setBadgeValue:(NSInteger)value animated:(BOOL)animated;
-(void)dva_setBadgeString:(NSString*)string animated:(BOOL)animated;

@end
