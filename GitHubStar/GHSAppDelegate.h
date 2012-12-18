//
//  GHSAppDelegate.h
//  GitHubStar
//
//  Created by nie dianhui on 12/11/12.
//  Copyright (c) 2012 nie dianhui. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class GHSPreferenceController;
@class GHSCredentialStore;

@interface GHSAppDelegate : NSObject <NSApplicationDelegate> {
    GHSPreferenceController *_preferenceController;
    GHSCredentialStore *_credentialStore;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)showPreferencePannel:(id)sender;
@end
