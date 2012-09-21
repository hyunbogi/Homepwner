//
//  AssetTypePicker.h
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 21..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Possession;

@interface AssetTypePicker : UITableViewController {
    Possession *possession_;
}

@property (nonatomic, retain) Possession *possession;

@end
