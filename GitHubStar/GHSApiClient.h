//
//  GHSApiClient.h
//  GitHubStar
//
//  Created by nie dianhui on 12/11/12.
//  Copyright (c) 2012 nie dianhui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface GHSApiClient : AFHTTPClient

+ (id) sharedInstance;


- (void) starredWithPage: (NSUInteger) page
                 success:(void (^)(id))successBlock;

@end
