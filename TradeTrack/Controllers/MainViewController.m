//
//  MainViewController.m
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/24/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import "MainViewController.h"
#import "MasterTableViewController.h"
#import "DetailViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIToolbar *topToolbar;
@property (weak, nonatomic) IBOutlet UIToolbar *bottomToolbar;

@end

MasterTableViewController *masterVC;
DetailViewController *detailsVC;

@implementation MainViewController

#pragma mark - VC Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self.mainTitle setTextColor:[UIColor whiteColor]];
    self.mainTitle.text = @"Trade Tracker";
    
    // Save pointers to the master and detail VCs
    for (UIViewController *vc in self.childViewControllers) {
        if ([vc isKindOfClass: MasterTableViewController.class]) {
            masterVC = (MasterTableViewController *)vc;
        } else if ([vc isKindOfClass: DetailViewController.class]) {
            detailsVC = (DetailViewController *)vc;
        }
    }
    if (masterVC) {
        masterVC.detailsVC = detailsVC;
    }
}

#pragma mark - User Actions

- (IBAction)settingsButtonPressed:(id)sender {
}

- (IBAction)filterButtonPressed:(id)sender {
}

- (IBAction)refreshButtonPressed:(id)sender {
    masterVC.saySomething = @"This is the deal dude";
    masterVC.numberOfRows = 20;
    [masterVC refreshMasterTable];
}

- (IBAction)onOffButtonPressed:(id)sender {
    masterVC.saySomething = @"Gimme a break";
    masterVC.numberOfRows = 200;
    [masterVC refreshMasterTable];
}

- (IBAction)addButtonPressed:(id)sender {
}

- (IBAction)masterSegmentedControlChanged:(id)sender {
}

@end
