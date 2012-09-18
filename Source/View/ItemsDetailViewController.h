//
//  ItemsDetailViewController.h
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 18..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Possession;

@interface ItemsDetailViewController : UIViewController {
    IBOutlet UITextField *nameField_;
    IBOutlet UITextField *serialNumberField_;
    IBOutlet UITextField *valuedField_;
    IBOutlet UILabel *dateLabel_;
    
    Possession *possession_;
}

@property (nonatomic, retain) Possession *possession;

@end
