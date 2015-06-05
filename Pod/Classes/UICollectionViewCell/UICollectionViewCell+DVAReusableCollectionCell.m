//
//  UICollectionViewCell+DVAReusableCollectionCell.m
//  InfiniteScroll
//
//  Created by Pablo Salvá on 05/06/15.
//  Copyright (c) 2015 Develapps. All rights reserved.
//

#import "UICollectionViewCell+DVAReusableCollectionCell.h"

@implementation UICollectionViewCell (DVAReusableCollectionCell)

+ (NSString *)dva_reuseIdentifierForCell {
    return NSStringFromClass(self);
}

+ (void)dva_registerCellWithCollectionView:(UICollectionView *)collectionView {
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(self) bundle:nil] forCellWithReuseIdentifier:[self dva_reuseIdentifierForCell]];
}

+ (UICollectionViewCell *)dva_dequeueCellFromCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:[self dva_reuseIdentifierForCell] forIndexPath:indexPath];
}

@end
