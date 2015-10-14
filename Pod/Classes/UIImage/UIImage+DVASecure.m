//
//  UIImage+MD5Hash.m
//  MyBae
//
//  Created by Pablo Romeu on 2/10/15.
//  Copyright © 2015 Mybæ. All rights reserved.
//

#import "UIImage+DVASecure.h"
#import "NSData+DVASecure.h"

@implementation UIImage (MD5Hash)
-(NSString*)MD5Hash{
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(self)];
    return [imageData dva_stringMD5hash];
}
@end
