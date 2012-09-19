//
//  ItemsViewController.h
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 17..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "View/ItemsDetailViewController.h"

@interface ItemsViewController : UITableViewController <ItemsDetailViewControllerDelegate>

- (IBAction)addNewPossession:(id)sender;
- (IBAction)toggleEditingMode:(id)sender;

@end
