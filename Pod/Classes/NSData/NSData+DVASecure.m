//
//  NSData+MD5.m
//  MyBae
//
//  Created by Pablo Romeu on 7/9/15.
//  Copyright (c) 2015 Mybæ. All rights reserved.
//

#import "NSData+DVASecure.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (MD5)

- (NSData*) dva_dataMD5hash {
    unsigned int outputLength = CC_MD5_DIGEST_LENGTH;
    unsigned char output[outputLength];
    
    CC_MD5(self.bytes, (unsigned int) self.length, output);
    return [NSMutableData dataWithBytes:output length:outputLength];
}

-(NSString*)dva_stringMD5hash{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5([self bytes], (unsigned int)[self length], result);
    NSString *hash = [NSString stringWithFormat:
                      @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                      result[0], result[1], result[2], result[3],
                      result[4], result[5], result[6], result[7],
                      result[8], result[9], result[10], result[11],
                      result[12], result[13], result[14], result[15]
                      ];
    return hash;
}

@end