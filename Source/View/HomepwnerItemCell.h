#import <UIKit/UIKit.h>

@class Possession;

@interface HomepwnerItemCell : UITableViewCell {
    UILabel *valueLabel_;
    UILabel *nameLabel_;
    UIImageView *imageView_;
}

- (void)setPossession:(Possession *)possession;

@end
