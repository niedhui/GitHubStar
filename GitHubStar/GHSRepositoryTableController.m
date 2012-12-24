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
#import "GHSCredentialStore.h"

@implementation GHSRepositoryTableController

- (id) init {
    NSLog(@"GHSRepositoryTableController init");
    self = [super init];
    if (self) {
        self.repositories = [NSMutableArray array];
        self.currentRepsitories = [NSMutableArray array];
        _apiClient = [GHSApiClient sharedInstance];
        _credentialStore = [[GHSCredentialStore alloc] init];
        if ([_credentialStore hasLogin]) {
            [self iterateStarred:1];
        }
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(apiClientCredentialChanged:) name:@"api-client-credential-changed" object:nil];
        _repositories_synched = NO;
    }
    return self;
    
}

- (void) awakeFromNib {
//    NSLog(@"GHSRepositoryTableController awake from nib");
}

- (NSInteger) numberOfRowsInTableView:(NSTableView *)tableView {
    NSLog(@"current count %ld", [self.currentRepsitories count]);
    return [self.currentRepsitories count];
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *identifier = [tableColumn identifier];
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:identifier owner:self];
    GHSRepository *repository = self.currentRepsitories[row];
    if ([identifier isEqualToString:@"NameCell"]) {
        cellView.textField.stringValue = [NSString defaultValue:repository.name];
    } else if ([identifier isEqualToString:@"LanguageCell"]){
        cellView.textField.stringValue = [NSString defaultValue:repository.language];
    } else if ([identifier isEqualToString:@"HTMLURLCell"]){
        cellView.textField.stringValue = [NSString defaultValue: repository.HTMLURLString];
    }
    return cellView;
}

- (void) tableViewSelectionDidChange:(NSNotification *)notification {
    NSInteger selectedRow = [self.tableView selectedRow];
    if (selectedRow > 0) {
        GHSRepository *repo = self.currentRepsitories[selectedRow];
        NSLog(@"selected %@", repo.name);
        [[NSWorkspace sharedWorkspace] openURL: [NSURL URLWithString:repo.HTMLURLString]];
    }
}

- (void)tableView:(NSTableView *)tableView sortDescriptorsDidChange:(NSArray *)oldDescriptors {
    NSArray *newDescriptors = [tableView sortDescriptors];
    self.currentRepsitories = [self.currentRepsitories sortedArrayUsingDescriptors:newDescriptors];
    [tableView reloadData];
}

- (void) iterateStarred:(NSUInteger) page {
    [_apiClient starredWithPage: page success:^(id returnedRepositories) {
        [self.repositories addObjectsFromArray:returnedRepositories];
        NSLog(@"synch page %ld", page);
//        [self.tableView reloadData];
        if ([returnedRepositories count] == 100) {
            [self iterateStarred:page + 1];
        } else {
            _repositories_synched = YES;
            self.currentRepsitories = [NSArray arrayWithArray:self.repositories];
            [self.tableView reloadData];
        }
    }];
}

- (IBAction)onSearch:(id)sender {
    NSString *searchedString = [sender stringValue];
    NSLog(@"on search %@", searchedString);
    if ([searchedString length] == 0) {
        self.currentRepsitories = [NSArray arrayWithArray:self.repositories];
    } else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name CONTAINS %@", searchedString];
        self.currentRepsitories = [self.repositories filteredArrayUsingPredicate:predicate];
        
    }
    [self.tableView reloadData];
}

- (void) apiClientCredentialChanged: (NSNotification *)notification {
    if ([_credentialStore hasLogin]) {
        [self iterateStarred:1];
    }
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
