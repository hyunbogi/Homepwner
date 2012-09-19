//
//  PossessionStore.h
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 17..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Possession.h"

@interface PossessionStore : NSObject {
    NSMutableArray *allPossessions_;
}

+ (PossessionStore *)defaultStore;

- (NSArray *)allPossessions;
- (Possession *)createPossession;
- (void)removePossession:(Possession *)p;
- (void)movePossessionAtIndex:(NSInteger)from
                      toIndex:(NSInteger)to;

- (NSString *)possessionArchivePath;
- (BOOL)saveChange;
- (void)fetchPossessionsIfNecessary;

@end
