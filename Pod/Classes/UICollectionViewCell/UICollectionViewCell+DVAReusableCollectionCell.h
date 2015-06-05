//
//  UICollectionViewCell+DVAReusableCollectionCell.h
//  InfiniteScroll
//
//  Created by Pablo Salvá on 05/06/15.
//  Copyright (c) 2015 Develapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (DVAReusableCollectionCell)

+ (NSString *)dva_reuseIdentifierForCell;
+ (void)dva_registerCellWithCollectionView:(UICollectionView *)collectionView;
+ (UICollectionViewCell *)dva_dequeueCellFromCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end
