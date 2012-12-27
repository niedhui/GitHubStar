//
//  GHSRespositoryTableController.h
//  GitHubStar
//
//  Created by nie dianhui on 12/14/12.
//  Copyright (c) 2012 nie dianhui. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GHSApiClient;
@class GHSCredentialStore;

extern NSString * const GHSStartFetchingNotification;
extern NSString * const GHSFinishFetchingNotification;
extern NSString * const GHSStartFetchingPageNotification;

@interface GHSRepositoryTableController : NSWindowController<NSTableViewDataSource, NSTableViewDelegate> {
    BOOL _repositories_synched;
    GHSApiClient *_apiClient;
    GHSCredentialStore *_credentialStore;
}

@property (strong) NSMutableArray *repositories;
@property (copy) NSArray *currentRepsitories;
@property (weak) IBOutlet NSTableView *tableView;
@property (weak) IBOutlet NSProgressIndicator *progressIndicator;
@property (weak) IBOutlet NSTextField *statusLabel;

- (IBAction) onSearch: (id)sender;

@end
