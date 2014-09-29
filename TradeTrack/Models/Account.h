//
//  Account.h
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/27/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Trade, User;

@interface Account : NSManagedObject

@property (nonatomic, retain) NSString * agency;
@property (nonatomic, retain) NSNumber * balance;
@property (nonatomic, retain) NSDate * createdOn;
@property (nonatomic, retain) NSNumber * currentInvestmentPercentage;
@property (nonatomic, retain) NSString * miniDescription;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * parseId;
@property (nonatomic, retain) NSNumber * targetInvestmentPercentage;
@property (nonatomic, retain) NSDate * updatedAt;
@property (nonatomic, retain) User *owner;
@property (nonatomic, retain) NSSet *trades;
@end

@interface Account (CoreDataGeneratedAccessors)

- (void)addTradesObject:(Trade *)value;
- (void)removeTradesObject:(Trade *)value;
- (void)addTrades:(NSSet *)values;
- (void)removeTrades:(NSSet *)values;

@end
