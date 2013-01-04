//
//  GHSRepoCellView.h
//  GitHubStar
//
//  Created by nie dianhui on 1/4/13.
//  Copyright (c) 2013 nie dianhui. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GHSRepoCellView : NSTableCellView

@property (weak) IBOutlet NSTextField *repoNameField;
@property (weak) IBOutlet NSTextField *repoDescField;
@end