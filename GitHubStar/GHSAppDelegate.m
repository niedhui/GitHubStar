//
//  GHSAppDelegate.m
//  GitHubStar
//
//  Created by nie dianhui on 12/11/12.
//  Copyright (c) 2012 nie dianhui. All rights reserved.
//

#import "GHSAppDelegate.h"
#import "GHSPreferenceController.h"
#import "GHSCredentialStore.h"

@implementation GHSAppDelegate

- (void) awakeFromNib {
    NSLog(@"GHSAppDelegate awake from nib");
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSLog(@"applicationDidFinishLaunching");
    _credentialStore = [[GHSCredentialStore alloc] init];
    if (![_credentialStore hasLogin]) {
        [self showPreferencePannel:nil];
    }
}

- (IBAction)showPreferencePannel:(id)sender {
    if (!_preferenceController) {
        _preferenceController = [[GHSPreferenceController alloc] init];
    }
    [_preferenceController showWindow:self];
    NSLog(@"show preference pannel");
}


@end
