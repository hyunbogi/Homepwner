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
    NSMutableArray *possessionsOver50Dollars_;
    NSMutableArray *possessionsUnder50Dollars_;
}

+ (PossessionStore *)defaultStore;

- (NSArray *)possessionsOver50Dollars;
- (NSArray *)possessionsUnder50Dollars;
- (Possession *)createPossession;

@end
