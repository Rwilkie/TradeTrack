//
//  MasterTableViewController.h
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/24/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewController.h"
#import "NewAccountViewController.h"

@protocol masterTableVCDelegate <NSObject>

-(void) activityAnimation: (BOOL) animate;

@end

@interface MasterTableViewController : UITableViewController <NewAccountDelegate>

@property DetailViewController *detailsVC;

@property id <masterTableVCDelegate> delegate;

-(void) refreshMasterTable;

@end
