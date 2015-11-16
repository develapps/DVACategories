//
//  UILabel+DVABadgeLabel.m
//  MyBae
//
//  Created by Pablo Romeu on 25/8/15.
//  Copyright (c) 2015 Mybæ. All rights reserved.
//

#import "UILabel+DVABadgeLabel.h"

@implementation DVABadgeLabelConfigurator
@end

@implementation UILabel (DVABadgeLabel)
- (void)dva_addBadgeLabelToView:(UIView*)theView andPosition:(DVABadgeViewPosition)position andOffset:(UIOffset)offset{
    DVABadgeLabelConfigurator *configurator = [DVABadgeLabelConfigurator new];
    configurator.backgroundColor = [UIColor redColor];
    configurator.textColor      = [UIColor whiteColor];
    configurator.position = position;
    configurator.offset = offset;
    [self dva_addBadgeLabelToView:theView usingConfigurator:configurator];
}

- (void)dva_addBadgeLabelToView:(UIView*)theView usingConfigurator:(DVABadgeLabelConfigurator*)configurator{
    self.backgroundColor = configurator.backgroundColor;
    self.textColor = configurator.textColor;
    self.textAlignment = NSTextAlignmentCenter;
    self.layer.cornerRadius = CGRectGetWidth(self.bounds)/2.0;
    self.clipsToBounds = YES;
    self.hidden=YES;

    theView.clipsToBounds=NO;
    
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [theView dva_addBadgeView:self andPosition:configurator.position andOffset:configurator.offset];
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
    [self dva_setBadgeString:[NSString stringWithFormat:@"%li",(long)value] animated:animated];
}

-(void)dva_setBadgeString:(NSString*)string animated:(BOOL)animated{
    if (!animated) {
        self.hidden=(string || [string isEqualToString:@""])?YES:NO;
        self.text = string;
        return;
    }
    
    if (string==nil || [string isEqualToString:@""]) {
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
        
        self.text = string;
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
