//
//  MasterTableViewController.m
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/24/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import "MasterTableViewController.h"
#import "NewAccountViewController.h"

#import "GlobalState.h"

#import "Account.h"
#import "Strategy.h"

@interface MasterTableViewController ()

@end

NSArray *accounts;
NSArray *strategies;

@implementation MasterTableViewController

#pragma mark - VC Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self refreshMasterTable];
}

#pragma mark - Exposed Methods

-(void)refreshMasterTable {
    
    [self.delegate activityAnimation:YES];
    
    if ([self showAccounts]) {
        [self.navigationItem.rightBarButtonItem setEnabled:YES];
        accounts = [Account findAllSortedBy:@"name" ascending:YES];
    } else {
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
        strategies = [Strategy findAll];
    }
    NSLog(@"Displaying the table");
    [self.tableView reloadData];
}

#pragma mark - User Actions

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([self showAccounts]) {
        if ([segue.identifier isEqualToString:@"AddAccountSegue"]) {
            NewAccountViewController *acctVC = segue.destinationViewController;
            acctVC.accountToChange = nil;
            acctVC.delegate = self;
        } else if ([segue.identifier isEqualToString:@"AccountInfoSegue"]) {
            NewAccountViewController *acctVC = segue.destinationViewController;
            acctVC.delegate = self;
            acctVC.accountToChange = [accounts objectAtIndex:[self.tableView indexPathForCell:sender].row];
        }
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

#pragma  mark - Delegate

-(void)accountSaved {
    [self refreshMasterTable];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self showAccounts]) {
        NSLog(@"There are %d accounts", (int)accounts.count);
        return accounts.count;
    } else {
        return strategies.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MasterTableCell"];
    
    if ([self showAccounts]) {
        Account *account = [accounts objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"Account %d: %@", (int)indexPath.row, account.name];
        cell.detailTextLabel.text = account.miniDescription;
    } else {
        Strategy *strategy = [strategies objectAtIndex:indexPath.row];
        cell.textLabel.text = strategy.name;
        cell.detailTextLabel.text = strategy.miniDescription;
    }
    return cell;
}

-(BOOL) showAccounts {
    return ([GlobalState data].sortBy == kAccounts) ? YES : NO;
}

@end
