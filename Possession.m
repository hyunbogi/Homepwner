//
//  Possession.m
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 21..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import "Possession.h"

@implementation Possession

@dynamic dateCreated;
@dynamic imageKey;
@dynamic orderingValue;
@dynamic possessionName;
@dynamic serialNumber;
@dynamic thumbnail;
@dynamic thumbnailData;
@dynamic valueInDollars;
@dynamic assetType;

+ (CGSize)thumbnailSize {
    return CGSizeMake(40, 40);
}

- (void)setThumbnailDataFromImage:(UIImage *)image {
    CGSize originalImageSize = [image size];
    
    CGRect newRect = {0, };
    newRect.origin = CGPointZero;
    newRect.size = [[self class] thumbnailSize];
    
    float ratio = MAX(newRect.size.width / originalImageSize.width,
                      newRect.size.height / originalImageSize.height);
    
    UIGraphicsBeginImageContext(newRect.size);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:newRect
                                                    cornerRadius:5.0];
    [path addClip];
    
    CGRect projectRect = {0, };
    projectRect.size.width = ratio * originalImageSize.width;
    projectRect.size.height = ratio * originalImageSize.height;
    projectRect.origin.x = (newRect.size.width - projectRect.size.width) / 2.0;
    projectRect.origin.y = (newRect.size.height - projectRect.size.height) / 2.0;
    
    [image drawInRect:projectRect];
    
    UIImage *small = UIGraphicsGetImageFromCurrentImageContext();
    [self setThumbnail:small];
    
    NSData* data = UIImagePNGRepresentation(small);
    [self setThumbnailData:data];
    
    UIGraphicsEndImageContext();
}

- (void)awakeFromFetch {
    [super awakeFromFetch];
    
    UIImage *tn = [UIImage imageWithData:[self thumbnailData]];
    [self setPrimitiveValue:tn forKey:@"thumbnail"];
}

- (void)awakeFromInsert {
    [super awakeFromInsert];
    [self setDateCreated:[NSDate date]];
}

@end
