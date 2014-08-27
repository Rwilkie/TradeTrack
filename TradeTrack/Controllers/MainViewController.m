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
#import "GlobalState.h"

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
    
    // Setup initial state
    (void)[[GlobalState alloc] init];

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
}

- (IBAction)onOffButtonPressed:(id)sender {
}

- (IBAction)addButtonPressed:(id)sender {
}

- (IBAction)masterSegmentedControlChanged:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 1) {
        [GlobalState data].sortBy = kStrategies;
    } else {
        [GlobalState data].sortBy = kAccounts;
    }
    [masterVC refreshMasterTable];
}

@end
