//
//  ItemsDetailViewController.m
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 18..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import "View/ItemsDetailViewController.h"
#import "Possession.h"

@implementation ItemsDetailViewController

@synthesize possession = possession_;

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [ipc setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else {
        [ipc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    [ipc setDelegate:self];
    
    [self presentModalViewController:ipc animated:YES];
    [ipc release];
}

- (IBAction)backgroundTapped:(id)sender {
    [[self view] endEditing:YES];
}

- (IBAction)removeImage:(id)sender {
    NSString *imageKey = [possession_ imageKey];
    if (imageKey) {
        [[ImageStore defaultImageStore] deleteImageForKey:imageKey];
        [possession_ setImageKey:nil];
    }
    
    [imageView_ setImage:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)viewDidUnload {
    [nameField_ release];
    nameField_ = nil;
    [serialNumberField_ release];
    serialNumberField_ = nil;
    [valuedField_ release];
    valuedField_ = nil;
    [dateLabel_ release];
    dateLabel_ = nil;
    [imageView_ release];
    imageView_ = nil;
    
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [nameField_ setText:[possession_ possessionName]];
    [serialNumberField_ setText:[possession_ serialNumber]];
    [valuedField_ setText:[NSString stringWithFormat:@"%d", [possession_ valueInDollars]]];
    
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    [dateLabel_ setText:[formatter stringFromDate:[possession_ dateCreated]]];
    
    [[self navigationItem] setTitle:[possession_ possessionName]];
    
    NSString *imageKey = [possession_ imageKey];
    if (imageKey) {
        UIImage *imageToDisplay = [[ImageStore defaultImageStore] imageForKey:imageKey];
        [imageView_ setImage:imageToDisplay];
    }
    else {
        [imageView_ setImage:nil];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[self view] endEditing:YES];
    
    [possession_ setPossessionName:[nameField_ text]];
    [possession_ setSerialNumber:[serialNumberField_ text]];
    [possession_ setValueInDollars:[[valuedField_ text] intValue]];
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSString *oldKey = [possession_ imageKey];
    if (oldKey) {
        [[ImageStore defaultImageStore] deleteImageForKey:oldKey];
    }
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    CFUUIDRef newUniqueID = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef newUniqueIDString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueID);
    [possession_ setImageKey:(NSString *)newUniqueID];
    CFRelease(newUniqueIDString);
    CFRelease(newUniqueID);
    
    [[ImageStore defaultImageStore] setImage:image
                                      forKey:[possession_ imageKey]];
    
    [self dismissModalViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)dealloc {
    [nameField_ release];
    [serialNumberField_ release];
    [valuedField_ release];
    [dateLabel_ release];
    [imageView_ release];
    [possession_ release];
    
    [super dealloc];
}

@end
