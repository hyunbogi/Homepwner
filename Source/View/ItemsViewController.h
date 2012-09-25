#import <Foundation/Foundation.h>
#import "View/ItemsDetailViewController.h"

@interface ItemsViewController : UITableViewController <ItemsDetailViewControllerDelegate>

- (IBAction)addNewPossession:(id)sender;
- (IBAction)toggleEditingMode:(id)sender;

@end
