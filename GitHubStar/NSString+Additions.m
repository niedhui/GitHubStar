//
//  NSString+Additions.m
//  GitHubStar
//
//  Created by nie dianhui on 12/12/12.
//  Copyright (c) 2012 nie dianhui. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)

+ (NSString *) defaultValue: (NSString *)string {
    if (string == nil) {
        return @"";
    } else {
        return string;
    }
}
@end
