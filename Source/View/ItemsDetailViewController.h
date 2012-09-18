//
//  ItemsDetailViewController.h
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 18..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store/ImageStore.h"

@class Possession;

@interface ItemsDetailViewController : UIViewController
        <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate> {
    IBOutlet UITextField *nameField_;
    IBOutlet UITextField *serialNumberField_;
    IBOutlet UITextField *valuedField_;
    IBOutlet UILabel *dateLabel_;
    IBOutlet UIImageView *imageView_;
    
    Possession *possession_;
}

@property (nonatomic, retain) Possession *possession;

- (IBAction)takePicture:(id)sender;
- (IBAction)backgroundTapped:(id)sender;
- (IBAction)removeImage:(id)sender;

@end
