//
//  GlobalState.m
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/25/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import "GlobalState.h"

@implementation GlobalState

// Setup default values for all globals here
-(void) defaults {
    _sortBy = kAccounts;
}

-(GlobalState *) resetToDefaults {
    _sharedData = nil;
    return [[GlobalState alloc] init];
}

// Class methods
static GlobalState *_sharedData = nil;

+(GlobalState *) data {
    @synchronized(self) {
        if(!_sharedData) {
            _sharedData = [[self alloc] init];
        }
    }
    
    // Setup defaults state
    return _sharedData;
}

-(GlobalState *)init {
    if (self = [super init]) {
        [self defaults];
        return self;
    }
    return nil;
}

@end
