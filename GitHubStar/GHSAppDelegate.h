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
@class GHSRepositoryTableController;

@interface GHSAppDelegate : NSObject <NSApplicationDelegate> {
    GHSPreferenceController *_preferenceController;
    GHSCredentialStore *_credentialStore;
    GHSRepositoryTableController *_repositoryController;
}

- (IBAction)showPreferencePannel:(id)sender;
@end
