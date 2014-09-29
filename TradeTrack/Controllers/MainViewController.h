//
//  MainViewController.h
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/24/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterTableViewController.h"

@interface MainViewController : UIViewController <masterTableVCDelegate>

@property (weak, nonatomic) IBOutlet UILabel *mainTitle;

@end
