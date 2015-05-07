//
//  UITableView+DVACellHeight.m
//  Develapps
//
//  Created by Pablo Romeu on 15/4/15.
//  Copyright (c) 2015 Develapps. All rights reserved.
//

#import "UITableView+DVACellHeight.h"

@implementation UITableView (DVACellHeight)

#pragma mark - Size for iOS 7

- (CGFloat)dva_heightForCellWithCellIdentifier:(NSString*)identifier
                     andConfigurationBlock:(void(^)(id cell))cellBlock{
    
    static UITableViewCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self dequeueReusableCellWithIdentifier:identifier];
    });
    cellBlock(sizingCell);
    return [self calculateHeightForConfiguredSizingCell:sizingCell];
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}

@end
