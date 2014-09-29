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
#import "Account.h"
#import "Strategy.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIToolbar *topToolbar;
@property (weak, nonatomic) IBOutlet UIToolbar *bottomToolbar;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *masterTableActivity;

@end

UINavigationController *navigationVC;
MasterTableViewController *masterVC;
DetailViewController *detailsVC;

@implementation MainViewController

#pragma mark - View Controller Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup initial state
    (void)[[GlobalState alloc] init];
    
    // Do any additional setup after loading the view.
    [self.mainTitle setTextColor:[UIColor whiteColor]];
    self.mainTitle.text = @"Trade Track";
    
    // Save pointers to the navigation, master and detail VCs
    for (UIViewController *vc in self.childViewControllers) {
        if ([vc isKindOfClass: [UINavigationController class]]) {
            navigationVC = (UINavigationController *)vc;
            masterVC = (MasterTableViewController *)navigationVC.topViewController;
        } else if ([vc isKindOfClass: DetailViewController.class]) {
            detailsVC = (DetailViewController *)vc;
        }
    }
    masterVC.detailsVC = detailsVC;
    masterVC.delegate = self;
    masterVC.title = @"Accounts";
}

#pragma mark - User Actions

- (IBAction)settingsButtonPressed:(id)sender {
    
}

- (IBAction)filterButtonPressed:(id)sender {
}

- (IBAction)refreshButtonPressed:(id)sender {
    NSArray *accounts = [Account findAll];
    for (Account *acct in accounts) {
        [acct deleteEntity];
    }
    [self saveMR];
    [masterVC refreshMasterTable];
}

- (IBAction)onOffButtonPressed:(id)sender {
}

- (IBAction)addButtonPressed:(id)sender {
    NSLog(@"Starting to build up teh array");
    for (int i=0; i<10000; i++) {
        Account *account = [Account createEntity];
        account.name = @"the Big Lebowski";
        account.miniDescription = @"Four score and I don't know how many years ago, we got started coding stuff";
        account.agency = @"The Dude Abides";
        account.balance = [NSNumber numberWithFloat:256.24];
    }
    NSLog(@"Saving them");
    [self saveMR];
    [masterVC refreshMasterTable];
}

- (IBAction)masterSegmentedControlChanged:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 1) {
        [masterVC setTitle:@"Strategies"];
        [GlobalState data].sortBy = kStrategies;
    } else {
        [masterVC setTitle:@"Accounts"];
        [GlobalState data].sortBy = kAccounts;
    }
    [masterVC refreshMasterTable];
}

-(void) saveMR {
    [MagicalRecord saveUsingCurrentThreadContextWithBlock:^(NSManagedObjectContext *localContext) {
    } completion:^(BOOL success, NSError *error) {
    }];
}

#pragma mark - Delegate Methods

-(void)activityAnimation:(BOOL)animate {
    if (animate) {
        [self.masterTableActivity startAnimating];
    } else {
        [self.masterTableActivity stopAnimating];
    }
}
@end
