// --------------------------------------------------------------------------
//! @author Sam Deane
//! @date 10/10/2011
//
//  Copyright 2011 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's 
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------

#import "NSMutableAttributedString+ECCore.h"
#import "NSData+ECCore.h"

@implementation NSMutableAttributedString(ECCore)


- (void)matchExpression:(NSRegularExpression*)expression options:(NSRegularExpressionOptions)options reversed:(BOOL)reversed action:(MatchAction)block
{
    NSAttributedString* original = [self copy];
    
    NSRange range = NSMakeRange(0, [self length]);
    NSArray* matches = [expression matchesInString:[self string] options:options range:range];
    NSUInteger count = [matches count];
    if (reversed)
    {
        while (count--)
        {
            block(original, self, [matches objectAtIndex:count]);
        }
    }
    else
    {
		NSUInteger n = 0;
        for (NSTextCheckingResult* match in matches)
        {
            block(original, self, [matches objectAtIndex:n++]);
        }
    }
    
    [original release];
}

@end
