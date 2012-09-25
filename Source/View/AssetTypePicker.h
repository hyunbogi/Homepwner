#import <UIKit/UIKit.h>

@class Possession;

@interface AssetTypePicker : UITableViewController {
    Possession *possession_;
}

@property (nonatomic, retain) Possession *possession;

@end
