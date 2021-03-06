//
//  TestClass.m
//  ECLazySample
//
//  Created by Sam Deane on 15/11/2011.
//  Copyright (c) 2011 Elegant Chaos. All rights reserved.
//

#import "TestClass.h"

    @implementation TestClass

    @synthesize test;

    + (void)initialize
    {
        if (self == [TestClass class])
        {
            [self initializeLazyProperties];
        }
    }

    @lazy_synthesize(test, @"test value"); 

    @end