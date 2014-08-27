//
//  MasterTableViewController.m
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/24/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import "MasterTableViewController.h"
#import "GlobalState.h"

@interface MasterTableViewController ()

@end

@implementation MasterTableViewController

#pragma mark - VC Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Exposed Methods
-(void)refreshMasterTable {
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numberOfRows;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *sort = ([GlobalState data].sortBy == kAccounts) ? @"Accounts" : @"Strategies";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MasterTableCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", self.saySomething, sort];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"... at row: %d", (int)indexPath.row];
    
    return cell;
}

@end
