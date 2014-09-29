//
//  Comments.h
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/27/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Trade, TradeTeam, User;

@interface Comments : NSManagedObject

@property (nonatomic, retain) NSString * comment;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * parseId;
@property (nonatomic, retain) NSDate * updatedAt;
@property (nonatomic, retain) User *owner;
@property (nonatomic, retain) TradeTeam *team;
@property (nonatomic, retain) Trade *trade;

@end
