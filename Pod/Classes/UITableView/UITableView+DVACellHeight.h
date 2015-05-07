//
//  UITableView+DVACellHeight
//  Develapps
//
//  Created by Pablo Romeu on 15/4/15.
//  Copyright (c) 2015 Develapps. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 A category for UITableView
 
 @since 1.0
 */
@interface UITableView (DVACellHeight)

/**
 This method calculates the height of a tableViewCell registered in the tableView and with autolayout correctly set.
 
 @param identifier the identifier
 @param cellBlock  a cell configuration block. Configure the provided cell there

 @return the size
 
 @warning  Do not use this method for iOS8 use Automatic sizing
 
 @since 1.0
 */
- (CGFloat)dva_heightForCellWithCellIdentifier:(NSString*)identifier
                          andConfigurationBlock:(void(^)(id cell))cellBlock;
@end
