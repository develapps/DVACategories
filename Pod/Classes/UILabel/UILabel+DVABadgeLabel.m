//
//  UILabel+DVABadgeLabel.m
//  MyBae
//
//  Created by Pablo Romeu on 25/8/15.
//  Copyright (c) 2015 Mybæ. All rights reserved.
//

#import "UILabel+DVABadgeLabel.h"

@implementation UILabel (DVABadgeLabel)
- (void)dva_addBadgeLabelToView:(UIView*)theView andPosition:(DVABadgeViewPosition)position andOffset:(UIOffset)offset{
    self.backgroundColor = [UIColor redColor];
    self.textColor = [UIColor whiteColor];
    self.textAlignment = NSTextAlignmentCenter;
    self.layer.cornerRadius = CGRectGetWidth(self.bounds)/2.0;
    self.clipsToBounds = YES;
    self.hidden=YES;

    theView.clipsToBounds=NO;
    
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [theView dva_addBadgeView:self andPosition:position andOffset:offset];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1.0
                                                      constant:self.bounds.size.width]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1.0
                                                      constant:self.bounds.size.height]];

}

-(void)dva_setBadgeValue:(NSInteger)value animated:(BOOL)animated{
    
    if (!animated) {
        self.hidden=value==0?YES:NO;
        self.text = [NSString stringWithFormat:@"%zd",value];
        return;
    }
    
    if (value == 0) {
        if (self.hidden){
            return;
        }
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
        animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
        animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 0.1)];
        [animation setFillMode:kCAFillModeForwards];

        CABasicAnimation *opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
        opacity.fromValue = [NSNumber numberWithFloat:1.0f];
        opacity.toValue = [NSNumber numberWithFloat:0.0f];
        
        CAAnimationGroup*group=[[CAAnimationGroup alloc] init];
        [group setAnimations:@[animation,opacity]];
        [group setDuration:0.6];
        [group setFillMode:kCAFillModeForwards];
        
        [CATransaction begin];
        [CATransaction setCompletionBlock:^{
            self.hidden=YES;
        }];
        [self.layer addAnimation:group forKey:@"disappear"];

        [CATransaction commit];
    }
    else{
        
        self.text = [NSString stringWithFormat:@"%zd",value];
        if (self.hidden){
            self.hidden=NO;
        }
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
        animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
        animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.2)];
        [animation setDuration:0.3];
        [animation setAutoreverses:YES];
        
        [self.layer addAnimation:animation forKey:@"big"];
    }

}

@end
