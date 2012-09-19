//
//  HomepwnerItemCell.h
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 20..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Possession;

@interface HomepwnerItemCell : UITableViewCell {
    UILabel *valueLabel_;
    UILabel *nameLabel_;
    UIImageView *imageView_;
}

- (void)setPossession:(Possession *)possession;

@end
