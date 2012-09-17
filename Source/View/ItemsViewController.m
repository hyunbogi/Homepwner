//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 17..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import "View/ItemsViewController.h"
#import "Possession.h"
#import "Store/PossessionStore.h"

@implementation ItemsViewController

- (id)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        for (int i = 0; i < 10; ++i) {
            [[PossessionStore defaultStore] createPossession];
        }
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:@"UITableViewCell"] autorelease];
    }
    
    if ([indexPath section] == 0) {
        Possession *p = [[[PossessionStore defaultStore] possessionsOver50Dollars] objectAtIndex:[indexPath row]];
        [[cell textLabel] setText:[p description]];
    }
    else {
        Possession *p = [[[PossessionStore defaultStore] possessionsUnder50Dollars] objectAtIndex:[indexPath row]];
        [[cell textLabel] setText:[p description]];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [[[PossessionStore defaultStore] possessionsOver50Dollars] count];
    }
    else {
        return [[[PossessionStore defaultStore] possessionsUnder50Dollars] count];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

@end
