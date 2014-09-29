//
//  Trade.m
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/27/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import "Trade.h"
#import "Account.h"
#import "Comments.h"
#import "Strategy.h"
#import "TradeTeam.h"
#import "Transaction.h"
#import "User.h"


@implementation Trade

@dynamic accountParseId;
@dynamic closed;
@dynamic closeDate;
@dynamic miniDescription;
@dynamic name;
@dynamic netProfit;
@dynamic openDate;
@dynamic parseId;
@dynamic potentialProfitAtOpen;
@dynamic strategyParseId;
@dynamic updatedAt;
@dynamic account;
@dynamic comments;
@dynamic originator;
@dynamic strategy;
@dynamic tradeTeams;
@dynamic transactions;

@end
