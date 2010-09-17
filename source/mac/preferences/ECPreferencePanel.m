// --------------------------------------------------------------------------
//! @author Sam Deane
//! @date 07/03/2010
//
//  Copyright 2010 Sam Deane, Elegant Chaos. All rights reserved.
// --------------------------------------------------------------------------

#import "ECPreferencePanel.h"


@implementation ECPreferencePanel

- (NSView *)paneView
{
    BOOL loaded = YES;
    
    if (!prefsView) 
	{
        loaded = [NSBundle loadNibNamed:@"view" owner:self];
    }
    
    if (loaded) 
	{
		[self paneDidLoad];
        return prefsView;
    }
    
    return nil;
}

- (NSImage *)paneIcon
{
    return [[[NSImage alloc] initWithContentsOfFile:
			 [[NSBundle bundleForClass:[self class]] pathForImageResource:@"icon"]
			 ] autorelease];
}

- (BOOL)allowsHorizontalResizing
{
    return NO;
}


- (BOOL)allowsVerticalResizing
{
    return NO;
}

- (void) paneDidLoad
{
	
}

- (NSString*) paneName
{
	NSString* name = [[NSBundle bundleForClass:[self class]] objectForInfoDictionaryKey: @"CFBundleName"];
	
    return name;
}

// --------------------------------------------------------------------------
// These methods must be overriden by the subclasses
// --------------------------------------------------------------------------

+ (NSArray*) preferencePanes
{
    return nil;
}


- (NSString*) paneToolTip
{
    return @"";
}
@end
