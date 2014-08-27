//
//  GlobalState.h
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/25/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SortByType) {
    kAccounts,
    kStrategies
};

@interface GlobalState : NSObject

@property SortByType sortBy;

+ (GlobalState *)data;
- (GlobalState *) init;
- (GlobalState *) resetToDefaults;

@end
