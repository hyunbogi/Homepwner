#import "Possession.h"
#import "Store/PossessionStore.h"
#import "View/HomepwnerItemCell.h"
#import "View/ItemsDetailViewController.h"
#import "View/ItemsViewController.h"

@implementation ItemsViewController

- (id)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                    target:self
                                                                    action:@selector(addNewPossession:)];
        [[self navigationItem] setRightBarButtonItem:rightBarButtonItem];
        [rightBarButtonItem release];
        
        [[self navigationItem] setTitle:@"Homepwner"];
        
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (IBAction)addNewPossession:(id)sender {
    Possession *newPossession = [[PossessionStore defaultStore] createPossession];
    
    ItemsDetailViewController *idvc = [[ItemsDetailViewController alloc] initForNewItem:YES];
    [idvc setDelegate:self];
    [idvc setPossession:newPossession];
    
    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:idvc];
    [idvc release];
    
    [naviController setModalPresentationStyle:UIModalPresentationFormSheet];
    [naviController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    [self presentModalViewController:naviController animated:YES];
    [naviController release];
}

- (IBAction)toggleEditingMode:(id)sender {
    if ([self isEditing]) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    }
    else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomepwnerItemCell *cell = (HomepwnerItemCell *)
                              [tableView dequeueReusableCellWithIdentifier:@"HomepwnerItemCell"];
    if (!cell) {
        cell = [[[HomepwnerItemCell alloc] initWithStyle:UITableViewCellStyleDefault
                                         reuseIdentifier:@"HomepwnerItemCell"] autorelease];
    }

    Possession *p = [[[PossessionStore defaultStore] allPossessions] objectAtIndex:[indexPath row]];
    [cell setPossession:p];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [[[PossessionStore defaultStore] allPossessions] count];
}

- (void)tableView:(UITableView *)tableView
        commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
         forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        PossessionStore *ps = [PossessionStore defaultStore];
        NSArray *possessions = [ps allPossessions];
        Possession *p = [possessions objectAtIndex:[indexPath row]];
        [ps removePossession:p];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:YES];
    }
}

- (void)tableView:(UITableView *)tableView
        moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
               toIndexPath:(NSIndexPath *)destinationIndexPath {
    [[PossessionStore defaultStore] movePossessionAtIndex:[sourceIndexPath row]
                                                  toIndex:[destinationIndexPath row]];
}

- (void)tableView:(UITableView *)tableView
        didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemsDetailViewController *idvc = [[[ItemsDetailViewController alloc] initForNewItem:NO] autorelease];
    
    NSArray *possessions = [[PossessionStore defaultStore] allPossessions];
    [idvc setPossession:[possessions objectAtIndex:[indexPath row]]];
    
    [[self navigationController] pushViewController:idvc animated:YES];
}

- (void)itemsDetailViewControllerWillDismiss:(ItemsDetailViewController *)controller {
    [[self tableView] reloadData];
}

@end
