//
//  GHSApiClient.m
//  GitHubStar
//
//  Created by nie dianhui on 12/11/12.
//  Copyright (c) 2012 nie dianhui. All rights reserved.
//

#import "GHSApiClient.h"
#import "GHSRepository.h"

@implementation GHSApiClient

+ (id) sharedInstance {
    static GHSApiClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[GHSApiClient alloc] initWithBaseURL: [NSURL URLWithString: kBaseApiURL ]];
    });
    return __sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        //custom settings
        [self setDefaultHeader: @"User-Agent" value: @"GitHubStar"];
        [self setDefaultHeader: @"Accept" value: kGHHttpAccept];
        [self setAuthorizationHeaderWithUsername: kGHUsername password: kGHPassword];
        [AFJSONRequestOperation addAcceptableContentTypes: [NSSet setWithObject: kGHHttpAccept]];
        
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    
    return self;
}

- (void) starredWithPage: (NSUInteger) page
                 success:(void (^)(id))successBlock{
    GHSApiClient *client = [GHSApiClient sharedInstance];
    [client getPath: kGHStarredURL
         parameters:@{ @"per_page" : @100,
                       @"page": [NSNumber numberWithInteger:page]
                     }
            success: ^(AFHTTPRequestOperation *operation, id responseObject) {
                NSArray *repositories = [responseObject mtl_mapUsingBlock:^id(id obj) {
                    return [GHSRepository modelWithExternalRepresentation: obj];
                }];
                successBlock(repositories);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"status code is %ld", operation.response.statusCode);
            }];
}

@end
