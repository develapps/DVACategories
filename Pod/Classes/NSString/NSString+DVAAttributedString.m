//
//  NSString+MyBae.m
//  MyBae
//
//  Created by Pablo Romeu on 29/7/15.
//  Copyright (c) 2015 Mybæ. All rights reserved.
//

#import "NSString+DVAAttributedString.h"
#import "NSString+DVALocalized.h"
#import "NSString+DVAAttributedString.h"
#import "NSAttributedString+DVAImageAttachment.h"
#import "NSAttributedString+DVAAttributedString.h"

@implementation NSString (DVAAttributedString)
+(NSAttributedString*)dva_attributedStringWithFont:(UIFont *)font
                                         andImages:(NSArray *)imagesNames
                                        withFormat:(NSString *)format, ...{
    
    va_list args;
    va_start(args, format);
    NSString *formattedString = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    __block NSAttributedString*as=[formattedString dva_attributedStringWithFont:font];
    [imagesNames enumerateObjectsUsingBlock:^(NSString*imageName, NSUInteger idx, BOOL *stop) {
        UIImage*image=[UIImage imageNamed:imageName];
        as=[as dva_stringWithImage:image];
    }];
    
    return as;
}

+(NSAttributedString*)dva_attributedStringWithFont:(UIFont *)font
                                         andFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSString *formattedString = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    return [formattedString dva_attributedStringWithFont:font];
}

-(NSAttributedString*)dva_attributedStringWithFont:(UIFont *)font
                                         andImages:(NSArray *)imagesNames{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wall"
    return [NSString dva_attributedStringWithFont:font andImages:imagesNames withFormat:self];
#pragma clang diagnostic pop
}

-(NSAttributedString*)dva_attributedStringWithFont:(UIFont *)font andColor:(UIColor*)color{
    NSMutableAttributedString*as=[[self dva_attributedStringWithFont:font ] mutableCopy];
    [as addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, [self length])];
    return as;
}

-(NSAttributedString*)dva_attributedStringWithFont:(UIFont *)font{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wall"
    return [NSString dva_attributedStringWithFont:font andImages:nil withFormat:self];
#pragma clang diagnostic pop
}

@end
