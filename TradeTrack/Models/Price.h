//
//  Price.h
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/27/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Equity;

@interface Price : NSManagedObject

@property (nonatomic, retain) NSNumber * extrinsicValue;
@property (nonatomic, retain) NSString * parseId;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSDate * updatedAt;
@property (nonatomic, retain) Equity *equity;

@end
