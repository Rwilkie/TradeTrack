//
//  MasterTableViewController.h
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/24/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewController.h"

@interface MasterTableViewController : UITableViewController

@property DetailViewController *detailsVC;

@property int numberOfRows;
@property NSString *saySomething;

-(void) refreshMasterTable;

@end
