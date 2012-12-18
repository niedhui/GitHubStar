//
//  GHSCredentialStore.m
//  GitHubStar
//
//  Created by nie dianhui on 12/18/12.
//  Copyright (c) 2012 nie dianhui. All rights reserved.
//

#import "GHSCredentialStore.h"


NSString * const GHSEmailKey = @"GHSEmail";
NSString * const GHSPasswordKey = @"GHSPassword";

@implementation GHSCredentialStore

- (BOOL) hasLogin {
    return !([self email] == nil || [self password] == nil);
}

// TODO:  check blank and throw error
- (void) setCredential:(NSString *)email password:(NSString *)password {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (email == nil) {
        [defaults removeObjectForKey: GHSEmailKey];
    } else {
        [defaults setObject: email forKey: GHSEmailKey];
    }
    if (password == nil) {
        [defaults removeObjectForKey: GHSPasswordKey];
    } else {
        [defaults setObject: password forKey: GHSPasswordKey];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"credential-changed" object:self];
    [defaults synchronize];
}

- (void) resetCredential {
    [self setCredential: nil password: nil];
    
}

- (NSString *) email {
    return [[NSUserDefaults standardUserDefaults] objectForKey: GHSEmailKey];
}

- (NSString *) password {
    return [[NSUserDefaults standardUserDefaults] objectForKey: GHSPasswordKey];
}

@end
