//
//  PBCommitMessageView.m
//  GitX
//
//  Created by Jeff Mesnil on 13/10/08.
//  Copyright 2008 Jeff Mesnil (http://jmesnil.net/). All rights reserved.
//

#import "PBCommitMessageView.h"
#import "PBGitDefaults.h"

@implementation PBCommitMessageView

- (void)drawRect:(NSRect)aRect
{
	[super drawRect:aRect];

    if ([PBGitDefaults commitMessageViewHasVerticalLine]) {

        float characterWidth = [@" " sizeWithAttributes:[self typingAttributes]].width;
        float lineWidth = characterWidth * [PBGitDefaults commitMessageViewVerticalLineLength];
        NSRect line;
        float padding;
        float textViewHeight = [self bounds].size.height;

        // draw a vertical line after the given size (used as an indicator
        // for the first line of the commit message)
        [[NSColor lightGrayColor] set];
        padding = [[self textContainer] lineFragmentPadding];
        line.origin.x = padding + lineWidth;
        line.origin.y = 0;
        line.size.width = 1;
        line.size.height = textViewHeight;
        NSRectFill(line);

        // and one for the body of the commit message
        lineWidth = lineWidth = characterWidth * [PBGitDefaults commitMessageViewVerticalBodyLineLength];
        [[NSColor darkGrayColor] set];
        padding = [[self textContainer] lineFragmentPadding];
        line.origin.x = padding + lineWidth;
        line.origin.y = 0;
        line.size.width = 1;
        line.size.height = textViewHeight;
        NSRectFill(line);
    }
}

@end
