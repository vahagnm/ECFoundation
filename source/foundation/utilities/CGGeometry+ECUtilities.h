// --------------------------------------------------------------------------
//! @author Sam Deane
//! @date 02/04/2011
//
//  Copyright 2011 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's 
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------


NS_INLINE CGPoint CGRectGetCentre(CGRect aRect) {
    CGPoint centre = CGPointMake(CGRectGetMidX(aRect), CGRectGetMidY(aRect));
    return centre;
}

NS_INLINE CGRect CGSetCentre(CGRect aRect, CGPoint centre) {
    aRect.origin.x = centre.x - (aRect.size.width * 0.5f);
    aRect.origin.y = centre.y - (aRect.size.height * 0.5f);
    
    return aRect;
}

