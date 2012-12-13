//
//  GHSRespositoryTableController.m
//  GitHubStar
//
//  Created by nie dianhui on 12/14/12.
//  Copyright (c) 2012 nie dianhui. All rights reserved.
//

#import "GHSRepositoryTableController.h"
#import "GHSApiClient.h"
#import "GHSRepository.h"
#import "NSString+Additions.h"

@implementation GHSRepositoryTableController

- (id) init {
    NSLog(@"GHSRepositoryTableController init");
    self = [super init];
    if (!self) {
        return nil;
    }
    self.repositories = [NSMutableArray array];
    [self iterateStarred:1];
    return self;
    
}

- (void) awakeFromNib {
    NSLog(@"GHSRepositoryTableController awake from nib");
}

- (NSInteger) numberOfRowsInTableView:(NSTableView *)tableView {
    NSLog(@"current count %ld", [self.repositories count]);
    return [self.repositories count];
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *identifier = [tableColumn identifier];
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:identifier owner:self];
    GHSRepository *repository = self.repositories[row];
    if ([identifier isEqualToString:@"NameCell"]) {
        cellView.textField.stringValue = [NSString defaultValue:repository.name];
    } else if ([identifier isEqualToString:@"LanguageCell"]){
        cellView.textField.stringValue = [NSString defaultValue:repository.language];
    } else if ([identifier isEqualToString:@"HTMLURLCell"]){
        cellView.textField.stringValue = [NSString defaultValue: repository.HTMLURLString];
    }
    return cellView;
}



- (void) iterateStarred:(NSUInteger) page {
    [[GHSApiClient sharedInstance] starredWithPage: page success:^(id returnedRepositories) {
        [self.repositories addObjectsFromArray:returnedRepositories];
        [self.tableView reloadData];
        if ([returnedRepositories count] == 100) {
            [self iterateStarred:page + 1];
        } else {
            NSLog(@"Done!");
            
        }
    }];
}

@end
