//
//  Trade.h
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/27/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Account, Comments, Strategy, TradeTeam, Transaction, User;

@interface Trade : NSManagedObject

@property (nonatomic, retain) NSString * accountParseId;
@property (nonatomic, retain) NSNumber * closed;
@property (nonatomic, retain) NSDate * closeDate;
@property (nonatomic, retain) NSString * miniDescription;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * netProfit;
@property (nonatomic, retain) NSDate * openDate;
@property (nonatomic, retain) NSString * parseId;
@property (nonatomic, retain) NSNumber * potentialProfitAtOpen;
@property (nonatomic, retain) NSString * strategyParseId;
@property (nonatomic, retain) NSDate * updatedAt;
@property (nonatomic, retain) Account *account;
@property (nonatomic, retain) NSSet *comments;
@property (nonatomic, retain) User *originator;
@property (nonatomic, retain) Strategy *strategy;
@property (nonatomic, retain) NSSet *tradeTeams;
@property (nonatomic, retain) NSSet *transactions;
@end

@interface Trade (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(Comments *)value;
- (void)removeCommentsObject:(Comments *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

- (void)addTradeTeamsObject:(TradeTeam *)value;
- (void)removeTradeTeamsObject:(TradeTeam *)value;
- (void)addTradeTeams:(NSSet *)values;
- (void)removeTradeTeams:(NSSet *)values;

- (void)addTransactionsObject:(Transaction *)value;
- (void)removeTransactionsObject:(Transaction *)value;
- (void)addTransactions:(NSSet *)values;
- (void)removeTransactions:(NSSet *)values;

@end
