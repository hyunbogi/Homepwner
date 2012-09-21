//
//  Possession.h
//  RandomPossessions
//
//  Created by Hyunbok Lee on 12. 8. 14..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Possession : NSObject <NSCoding> {
    NSString *possessionName_;
    NSString *serialNumber_;
    int valueInDollars_;
    NSDate *dateCreated_;
    
    NSString *imageKey_;
    UIImage *thumbnail_;
    NSData *thumbnailData_;
}

@property (nonatomic, copy) NSString *possessionName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly) NSDate *dateCreated;
@property (nonatomic, copy) NSString *imageKey;
@property (readonly) UIImage *thumbnail;

+ (id)randomPossession;
+ (CGSize)thumbnailSize;

- (id)initWithPossessionName:(NSString *)name
              valueInDollars:(int)value
                serialNumber:(NSString *)sNumber;

- (void)setThumbnailDataFromImage:(UIImage *)image;

@end
