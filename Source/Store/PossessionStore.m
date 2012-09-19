//
//  PossessionStore.m
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 17..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import "Store/PossessionStore.h"
#import "Possession.h"

static PossessionStore *defaultStore_ = nil;

@implementation PossessionStore

+ (PossessionStore *)defaultStore {
    if (!defaultStore_) {
        defaultStore_ = [[super allocWithZone:nil] init];
    }
    return defaultStore_;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [self defaultStore];
}

- (id)init {
    if (defaultStore_) {
        return defaultStore_;
    }

    self = [super init];    
    return self;
}

- (NSArray *)allPossessions {
    [self fetchPossessionsIfNecessary];
    return allPossessions_;
}

- (Possession *)createPossession {
    [self fetchPossessionsIfNecessary];
    
    Possession *p = [Possession randomPossession];
    [allPossessions_ addObject:p];
    
    return p;
}

- (void)removePossession:(Possession *)p {
    [allPossessions_ removeObjectIdenticalTo:p];
}

- (void)movePossessionAtIndex:(NSInteger)from
                      toIndex:(NSInteger)to {
    if (from == to) {
        return;
    }
    
    Possession *p = [allPossessions_ objectAtIndex:from];
    [p retain];
    [allPossessions_ removeObjectAtIndex:from];
    [allPossessions_ insertObject:p atIndex:to];
    [p release];
}

- (NSString *)possessionArchivePath {
    return pathInDocumentDirectory(@"possessions.data");
}

- (BOOL)saveChange {
    return [NSKeyedArchiver archiveRootObject:allPossessions_
                                       toFile:[self possessionArchivePath]];
}

- (void)fetchPossessionsIfNecessary {
    if (!allPossessions_) {
        NSString *path = [self possessionArchivePath];
        allPossessions_ = [[NSKeyedUnarchiver unarchiveObjectWithFile:path] retain];
    }
    
    if (!allPossessions_) {
        allPossessions_ = [[NSMutableArray alloc] init];
    }
}

- (id)retain {
    return self;
}

- (oneway void)release {
    // do nothing
}

- (id)autorelease {
    return self;
}

- (NSUInteger)retainCount {
    return NSUIntegerMax;
}

@end
