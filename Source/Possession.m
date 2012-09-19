//
//  Possession.m
//  RandomPossessions
//
//  Created by Hyunbok Lee on 12. 8. 14..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import "Possession.h"

@implementation Possession

@synthesize possessionName = possessionName_;
@synthesize serialNumber = serialNumber_;
@synthesize valueInDollars = valueInDollars_;
@synthesize dateCreated = dateCreated_;
@synthesize imageKey = imageKey_;

+ (id)randomPossession {
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy", @"Rusty", @"Shiny", nil];
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear", @"Spork", @"Mac", nil];
    
    int adjectiveIndex = rand() % [randomAdjectiveList count];
    int nounIndex = rand() % [randomNounList count];
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList objectAtIndex:nounIndex]];
    int randomValue = rand() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10];
    
    Possession *newPossession = [[self alloc] initWithPossessionName:randomName
                                                      valueInDollars:randomValue
                                                        serialNumber:randomSerialNumber];
    return [newPossession autorelease];
}

- (id)initWithPossessionName:(NSString *)name
              valueInDollars:(int)value
                serialNumber:(NSString *)sNumber {
    self = [super init];
    if (self) {
        [self setPossessionName:name];
        [self setSerialNumber:sNumber];
        [self setValueInDollars:value];
        dateCreated_ = [[NSDate alloc] init];
    }
    return self;
}

- (id)init {
    return [self initWithPossessionName:@"Possession"
                         valueInDollars:0
                           serialNumber:@""];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        [self setPossessionName:[aDecoder decodeObjectForKey:@"possessionName"]];
        [self setSerialNumber:[aDecoder decodeObjectForKey:@"serialNumber"]];
        [self setValueInDollars:[aDecoder decodeIntForKey:@"valueInDollars"]];
        dateCreated_ = [[aDecoder decodeObjectForKey:@"dateCreated"] retain];
        [self setImageKey:[aDecoder decodeObjectForKey:@"imageKey"]];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:possessionName_ forKey:@"possessionName"];
    [aCoder encodeObject:serialNumber_ forKey:@"serialNumber"];
    [aCoder encodeObject:dateCreated_ forKey:@"dateCreated"];
    [aCoder encodeObject:imageKey_ forKey:@"imageKey"];
    [aCoder encodeInt:valueInDollars_ forKey:@"valueInDollars"];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
            possessionName_, serialNumber_, valueInDollars_, dateCreated_];
}

- (void)dealloc {
    [possessionName_ release];
    [serialNumber_ release];
    [dateCreated_ release];
    [imageKey_ release];
    [super dealloc];
}

@end
