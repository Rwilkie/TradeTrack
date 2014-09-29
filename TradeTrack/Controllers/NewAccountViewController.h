//
//  NewAccountViewController.h
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/27/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Account.h"

@protocol NewAccountDelegate <NSObject>

-(void) accountSaved;

@end

@interface NewAccountViewController : UIViewController

@property id <NewAccountDelegate> delegate;
@property Account *accountToChange;

@end
