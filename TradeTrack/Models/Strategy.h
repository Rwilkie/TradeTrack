//
//  Strategy.h
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/27/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Trade;

@interface Strategy : NSManagedObject

@property (nonatomic, retain) NSDate * createdOn;
@property (nonatomic, retain) NSNumber * howBullish;
@property (nonatomic, retain) NSString * howItCanLooseMoney;
@property (nonatomic, retain) NSString * howItMakesMoney;
@property (nonatomic, retain) NSNumber * maxIVRank;
@property (nonatomic, retain) NSString * miniDescription;
@property (nonatomic, retain) NSNumber * minIVRank;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * parseId;
@property (nonatomic, retain) NSDate * updatedAt;
@property (nonatomic, retain) NSSet *trades;
@end

@interface Strategy (CoreDataGeneratedAccessors)

- (void)addTradesObject:(Trade *)value;
- (void)removeTradesObject:(Trade *)value;
- (void)addTrades:(NSSet *)values;
- (void)removeTrades:(NSSet *)values;

@end
