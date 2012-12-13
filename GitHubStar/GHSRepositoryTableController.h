//
//  GHSRespositoryTableController.h
//  GitHubStar
//
//  Created by nie dianhui on 12/14/12.
//  Copyright (c) 2012 nie dianhui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GHSRepositoryTableController : NSObject<NSTableViewDataSource, NSTableViewDelegate>

@property (strong) NSMutableArray *repositories;
@property (weak) IBOutlet NSTableView *tableView;

@end
