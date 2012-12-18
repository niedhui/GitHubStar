//
//  GHSPreferenceController.m
//  GitHubStar
//
//  Created by nie dianhui on 12/17/12.
//  Copyright (c) 2012 nie dianhui. All rights reserved.
//

#import "GHSPreferenceController.h"
#import "GHSCredentialStore.h"

@interface GHSPreferenceController ()

@end

@implementation GHSPreferenceController

- (id) init {
    self = [super initWithWindowNibName:@"GHSPreferenceController"];
    return self;
}


- (void)windowDidLoad {
    [super windowDidLoad];
}

- (IBAction)login:(id)sender {
    NSString *email = self.emailField.stringValue;
    NSString *password = self.passwordField.stringValue;
    [[[GHSCredentialStore alloc] init] setCredential:email password:password];
    NSLog(@"email: %@  \n password: %@", email, password);
    
}

@end
