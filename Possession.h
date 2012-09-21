//
//  Possession.h
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 21..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

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
