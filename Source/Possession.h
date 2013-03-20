#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>

@interface Possession : NSManagedObject

@property (nonatomic, retain) NSString *serialNumber;
@property (nonatomic, retain) NSNumber *valueInDollars;
@property (nonatomic, retain) UIImage *thumbnail;
@property (nonatomic, retain) NSString *imageKey;
@property (nonatomic, retain) NSDate *dateCreated;
@property (nonatomic, retain) NSString *possessionName;
@property (nonatomic, retain) NSData * thumbnailData;
@property (nonatomic, retain) NSNumber *orderingValue;
@property (nonatomic, retain) NSManagedObject *assetType;

+ (CGSize)thumbnailSize;

- (void)setThumbnailDataFromImage:(UIImage *)image;

@end
