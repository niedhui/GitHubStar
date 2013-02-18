//
//  GHSSearchField.m
//  GitHubStar
//
//  Created by nie dianhui on 1/7/13.
//  Copyright (c) 2013 nie dianhui. All rights reserved.
//

#import "GHSSearchField.h"

@implementation GHSSearchField

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


//- (void)drawRect:(NSRect)dirtyRect
//{
//    // Drawing code here.
//}

- (void)keyDown:(NSEvent *)theEvent {
    NSLog(@"search key: %hu", theEvent.keyCode);
}

- (void)flagsChanged:(NSEvent *)theEvent {
    NSLog(@"flag changed %lu", theEvent.modifierFlags);
}
@end
