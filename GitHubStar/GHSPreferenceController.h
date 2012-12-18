//
//  GHSPreferenceController.h
//  GitHubStar
//
//  Created by nie dianhui on 12/17/12.
//  Copyright (c) 2012 nie dianhui. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GHSPreferenceController : NSWindowController
@property (weak) IBOutlet NSTextField *emailField;
@property (weak) IBOutlet NSSecureTextField *passwordField;

- (IBAction)login:(id)sender;

@end
