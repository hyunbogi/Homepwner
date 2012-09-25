#import <UIKit/UIKit.h>
#import "Store/ImageStore.h"
#import "Store/PossessionStore.h"

@class Possession;
@class ItemsDetailViewController;

@protocol ItemsDetailViewControllerDelegate <NSObject>

@optional
- (void)itemsDetailViewControllerWillDismiss:(ItemsDetailViewController *)controller;

@end

@interface ItemsDetailViewController : UIViewController
        <UINavigationControllerDelegate, UIImagePickerControllerDelegate,
        UITextFieldDelegate, UIPopoverControllerDelegate> {
    IBOutlet UITextField *nameField_;
    IBOutlet UITextField *serialNumberField_;
    IBOutlet UITextField *valuedField_;
    IBOutlet UILabel *dateLabel_;
    IBOutlet UIImageView *imageView_;
    IBOutlet UIButton *assetTypeButton_;
    
    Possession *possession_;

    UIPopoverController *imagePickerPopover_;
}

@property (nonatomic, retain) Possession *possession;
@property (nonatomic, assign) id <ItemsDetailViewControllerDelegate> delegate;

- (id)initForNewItem:(BOOL)isNew;
- (IBAction)takePicture:(id)sender;
- (IBAction)backgroundTapped:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)removeImage:(id)sender;
- (IBAction)showAssetTypePicker:(id)sender;

@end
