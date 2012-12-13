//
//  GHSRepository.m
//  GitHubStar
//
//  Created by nie dianhui on 12/11/12.
//  Copyright (c) 2012 nie dianhui. All rights reserved.
//

#import "GHSRepository.h"

@implementation GHSRepository

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return @{
                @"name": @"name",
                @"language": @"language",
                @"HTMLURLString": @"html_url",
                @"description": @"description"
    
            };
}

//+ (NSValueTransformer *)HTMLURLTransformer {
//    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
//}

- (NSString *)description {
    return [NSString stringWithFormat: @"%@( %@  ): --> %@", self.name, self.language, self.HTMLURLString];
}

@end
