//
//  Possession.h
//  RandomPossessions
//
//  Created by Hyunbok Lee on 12. 8. 14..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Possession : NSObject {
    NSString *possessionName;
    NSString *serialNumber;
    int valueInDollars;
    NSDate *dateCreated;
}

@property (nonatomic, copy) NSString *possessionName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly) NSDate *dateCreated;

+ (id)randomPossession;

- (id)initWithPossessionName:(NSString *)name
              valueInDollars:(int)value
                serialNumber:(NSString *)sNumber;

@end
