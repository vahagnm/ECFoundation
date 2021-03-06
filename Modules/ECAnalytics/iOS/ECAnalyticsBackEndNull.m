// --------------------------------------------------------------------------
//! @author Sam Deane
//! @date 15/11/2011
//
//  Copyright 2012 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's 
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------
#import "ECAnalyticsBackEndNull.h"
#import "ECAnalyticsBackEnd.h"

#import "ECAnalyticsEvent.h"

@implementation ECAnalyticsBackEndNull

// --------------------------------------------------------------------------
//! Perform one-time initialisation of the engine.
// --------------------------------------------------------------------------

- (void)startupWithEngine:(ECAnalyticsEngine*)engineIn;
{
    self.engine = engineIn;
    
}

// --------------------------------------------------------------------------
//! Perform one-time cleanup of the engine.
// --------------------------------------------------------------------------

- (void)shutdown
{
}

// --------------------------------------------------------------------------
//! Log an un-timed event.
// --------------------------------------------------------------------------

- (void)eventUntimed:(NSString*)event forObject:(id)object parameters:(NSDictionary*)parameters
{
}

// --------------------------------------------------------------------------
//! Start logging a timed event. Returns the event, which can be ended by calling logTimedEventEnd:
// --------------------------------------------------------------------------

- (ECAnalyticsEvent*)eventStart:(NSString*)eventName forObject:(id)object parameters:(NSDictionary*)parameters;
{
	ECAnalyticsEvent* event = [[[ECAnalyticsEvent alloc] initWithName:eventName parameters:parameters] autorelease];

	return event;
}

// --------------------------------------------------------------------------
//! Finish logging a timed event.
// --------------------------------------------------------------------------

- (void)eventEnd:(ECAnalyticsEvent*)event
{
}

// --------------------------------------------------------------------------
//! Log an error.
// --------------------------------------------------------------------------

- (void)error:(NSError*)error message:(NSString*)message
{
}

// --------------------------------------------------------------------------
//! Log an exception.
// --------------------------------------------------------------------------

- (void)exception:(NSException*)exception
{
}

@end
