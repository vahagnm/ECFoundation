//
//  AppDelegate.m
//  ECLoggingSampleMac
//
//  Created by Sam Deane on 29/09/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "ECAssertion.h"
#import "ECLogManager.h"
#import "ECLogHandlerNSLog.h"
#import "ECLogHandlerFile.h"
#import "ECLogHandlerStdout.h"
#import "ECLogHandlerStderr.h"

#import "TestClass.h"

@implementation AppDelegate

#pragma mark - Channels

ECDefineDebugChannel(ApplicationChannel);
ECDefineDebugChannel(ApplicationUpdateChannel);

#pragma mark - Properties

@synthesize window = _window;

#pragma mark - Object Lifecycle

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - Application Lifecycle

- (void)applicationWillFinishLaunching:(NSNotification *)notification
{
    // initialise log manager
    ECLogManager* lm = [ECLogManager sharedInstance];
    [lm startup];
    
    // install some handlers
    [lm registerHandler:[[[ECLogHandlerNSLog alloc] init] autorelease]];
    //    [lm registerHandler:[[[ECLogHandlerFile alloc] init] autorelease]];
    [lm registerHandler:[[[ECLogHandlerStdout alloc] init] autorelease]];
    [lm registerHandler:[[[ECLogHandlerStderr alloc] init] autorelease]];

    TestClass* test1 = [[TestClass alloc] init];
    TestClass* test2 = [[TestClass alloc] init];
    
    ECAssert([test1.test isEqualToString:@"test value"]);
    test1.test = @"something else";
    ECAssert([test1.test isEqualToString:@"something else"]);
    
    ECAssert([test2.test isEqualToString:@"test value"]);
    test2.test = @"doodah";
    ECAssert([test2.test isEqualToString:@"doodah"]);

    [test1 release];
    [test2 release];

    ECDebug(ApplicationChannel, @"will finish launching");
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    ECDebug(ApplicationChannel, @"did finish launching");
}

- (void)applicationWillHide:(NSNotification *)notification
{
    ECDebug(ApplicationChannel, @"will hide");
}

- (void)applicationDidHide:(NSNotification *)notification
{
    ECDebug(ApplicationChannel, @"did hide");
}

- (void)applicationWillUnhide:(NSNotification *)notification
{
    ECDebug(ApplicationChannel, @"will unhide");
}

- (void)applicationDidUnhide:(NSNotification *)notification
{
    ECDebug(ApplicationChannel, @"did unhide");
}

- (void)applicationWillBecomeActive:(NSNotification *)notification

{
    ECDebug(ApplicationChannel, @"will become active");
}

- (void)applicationDidBecomeActive:(NSNotification *)notification
{
    ECDebug(ApplicationChannel, @"did become active");
}

- (void)applicationWillResignActive:(NSNotification *)notification
{
    ECDebug(ApplicationChannel, @"will resign active");
    
    // save current log channels state
    [[ECLogManager sharedInstance] saveChannelSettings];
}

- (void)applicationDidResignActive:(NSNotification *)notification
{
    ECDebug(ApplicationChannel, @"did resign active");
}

- (void)applicationWillUpdate:(NSNotification *)notification
{
    ECDebug(ApplicationUpdateChannel, @"will update");
}

- (void)applicationDidUpdate:(NSNotification *)notification
{
    ECDebug(ApplicationUpdateChannel, @"did update");
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
    ECDebug(ApplicationChannel, @"will terminate");
    
    [[ECLogManager sharedInstance] shutdown];
}

- (void)applicationDidChangeScreenParameters:(NSNotification *)notification
{
    ECDebug(ApplicationChannel, @"did change screen parameters");
}



@end
