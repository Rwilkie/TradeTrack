//
//  Transaction.h
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/27/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Equity, Trade;

@interface Transaction : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSDate * expirationDate;
@property (nonatomic, retain) NSNumber * impliedVolAtOpen;
@property (nonatomic, retain) NSString * miniDescription;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * parseId;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSNumber * quantity;
@property (nonatomic, retain) NSDate * updatedAt;
@property (nonatomic, retain) Equity *equity;
@property (nonatomic, retain) Trade *trade;

@end
