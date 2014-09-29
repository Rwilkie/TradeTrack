//
//  NewAccountViewController.m
//  TradeTrack
//
//  Created by Wilkie, Rich on 8/27/14.
//  Copyright (c) 2014 Rich Wilkie. All rights reserved.
//

#import "NewAccountViewController.h"

@interface NewAccountViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextView *miniDescription;
@property (weak, nonatomic) IBOutlet UITextField *location;
@property (weak, nonatomic) IBOutlet UITextField *balance;
@property (weak, nonatomic) IBOutlet UIDatePicker *createdOnDatePicker;
@property (weak, nonatomic) IBOutlet UITextField *targetInvestPercentage;

@end

@implementation NewAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated {

    // If we're changing an acocunt, populate the view with the account info
    if (self.accountToChange) {
        self.name.text = self.accountToChange.name;
        self.miniDescription.text = self.accountToChange.miniDescription;
        self.location.text = self.accountToChange.agency;
        self.balance.text = self.accountToChange.balance.stringValue;
    }
}

#pragma mark - User Actions

- (IBAction)cancelPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)savePressed:(id)sender {
    if (![self checkAcocuntInfo]) {
        // TODO - Need to put up an error about the required fields
        return;
    }
    if (self.accountToChange) {
        self.accountToChange.name = self.name.text;
        self.accountToChange.miniDescription = self.miniDescription.text;
        self.accountToChange.agency = self.location.text;
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        self.accountToChange.balance = [formatter numberFromString:self.balance.text];
    } else {
        Account *account = [Account createEntity];
        account.name = self.name.text;
        account.miniDescription = self.miniDescription.text;
        account.agency = self.location.text;
        account.balance = [NSNumber numberWithFloat:12.89];
    }
    
    [self saveMR];
    [self.delegate accountSaved];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL) checkAcocuntInfo {
    if (self.name.text.length
        && self.miniDescription.text.length
        && self.location.text.length
        && self.balance.text.length) {
        return YES;
    }
    return NO;
}

-(void) saveMR {
    [MagicalRecord saveUsingCurrentThreadContextWithBlock:^(NSManagedObjectContext *localContext) {
    } completion:^(BOOL success, NSError *error) {
    }];
}

@end
