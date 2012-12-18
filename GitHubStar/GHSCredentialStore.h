//
//  GHSCredentialStore.h
//  GitHubStar
//
//  Created by nie dianhui on 12/18/12.
//  Copyright (c) 2012 nie dianhui. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const GHSEmailKey;
extern NSString * const GHSPasswordKey;

@interface GHSCredentialStore : NSObject

- (BOOL) hasLogin;

- (void) setCredential:(NSString *)email
              password:(NSString *) password;

- (void) resetCredential;

- (NSString *) email;
- (NSString *) password;
@end
