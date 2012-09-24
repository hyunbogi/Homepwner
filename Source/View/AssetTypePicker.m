//
//  AssetTypePicker.m
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 21..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import "View/AssetTypePicker.h"
#import "Store/PossessionStore.h"
#import "Possession.h"

@implementation AssetTypePicker

@synthesize possession = possession_;

- (id)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (id)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (void)dealloc {
    [possession_ release];
    [super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [[[PossessionStore defaultStore] allAssetTypes] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:@"UITableViewCell"] autorelease];
    }
    
    NSArray *allAssets = [[PossessionStore defaultStore] allAssetTypes];
    NSManagedObject *assetType = [allAssets objectAtIndex:[indexPath row]];
    
    NSString *assetLabel = [assetType valueForKey:@"label"];
    [[cell textLabel] setText:assetLabel];
    
    if (assetType == [possession_ assetType]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
    else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
        didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    
    NSArray *allAssets = [[PossessionStore defaultStore] allAssetTypes];
    NSManagedObject *assetType = [allAssets objectAtIndex:[indexPath row]];
    [possession_ setAssetType:assetType];
    
    [[self navigationController] popViewControllerAnimated:YES];
}

@end
