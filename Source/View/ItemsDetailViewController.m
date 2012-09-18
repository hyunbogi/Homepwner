//
//  ItemsDetailViewController.m
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 18..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import "View/ItemsDetailViewController.h"
#import "Possession.h"

@implementation ItemsDetailViewController

@synthesize possession = possession_;

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)viewDidUnload {
    [nameField_ release];
    nameField_ = nil;
    [serialNumberField_ release];
    serialNumberField_ = nil;
    [valuedField_ release];
    valuedField_ = nil;
    [dateLabel_ release];
    dateLabel_ = nil;

    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [nameField_ setText:[possession_ possessionName]];
    [serialNumberField_ setText:[possession_ serialNumber]];
    [valuedField_ setText:[NSString stringWithFormat:@"%d", [possession_ valueInDollars]]];
    
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    [dateLabel_ setText:[formatter stringFromDate:[possession_ dateCreated]]];
    
    [[self navigationItem] setTitle:[possession_ possessionName]];
}

- (void)dealloc {
    [nameField_ release];
    [serialNumberField_ release];
    [valuedField_ release];
    [dateLabel_ release];
    [possession_ release];
    
    [super dealloc];
}

@end
