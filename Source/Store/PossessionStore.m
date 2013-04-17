#import "Possession.h"
#import "Store/PossessionStore.h"
#import "Store/ImageStore.h"

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
    if (defaultStore_) return defaultStore_;

    self = [super init];
    
    model_ = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model_];
    
    NSString *path = PathInDocumentDirectory(@"store.data");
    NSURL *storeURL = [NSURL fileURLWithPath:path];
    
    NSError *error = nil;
    if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                           configuration:nil
                                     URL:storeURL
                                 options:nil
                                   error:&error]) {
        [NSException raise:@"Open failed"
                    format:@"Reason: %@", [error localizedDescription]];
    }
    
    context_ = [[NSManagedObjectContext alloc] init];
    [context_ setPersistentStoreCoordinator:psc];
    [psc release];
    
    [context_ setUndoManager:nil];
    
    return self;
}

- (NSArray *)allPossessions {
    [self fetchPossessionsIfNecessary];
    return allPossessions_;
}

- (Possession *)createPossession {
    [self fetchPossessionsIfNecessary];
    double order = 0.0;
    if ([allPossessions_ count] == 0) {
        order = 1.0;
    }
    else {
        order = [[[allPossessions_ lastObject] orderingValue] doubleValue] + 1.0;
    }
    NSLog(@"Adding after %d items, order = %.2f", [allPossessions_ count], order);
    
    Possession *p = [NSEntityDescription insertNewObjectForEntityForName:@"Possession"
                                                  inManagedObjectContext:context_];
    [p setOrderingValue:[NSNumber numberWithDouble:order]];
    
    [allPossessions_ addObject:p];
    
    return p;
}

- (void)removePossession:(Possession *)p {
    NSString *key = [p imageKey];
    [[ImageStore defaultImageStore] deleteImageForKey:key];
    [context_ deleteObject:p];
    [allPossessions_ removeObjectIdenticalTo:p];
}

- (void)movePossessionAtIndex:(NSInteger)from
                      toIndex:(NSInteger)to {
    if (from == to) return;
    
    Possession *p = [allPossessions_ objectAtIndex:from];
    [p retain];
    [allPossessions_ removeObjectAtIndex:from];
    [allPossessions_ insertObject:p atIndex:to];
    
    double lowerBound = 0.0;
    if (to > 0) {
        lowerBound = [[[allPossessions_ objectAtIndex:to - 1] orderingValue] doubleValue];
    }
    else {
        lowerBound = [[[allPossessions_ objectAtIndex:1] orderingValue] doubleValue] - 2.0;
    }
    
    double upperBound = 0.0;
    if (to < [allPossessions_ count] - 1) {
        upperBound = [[[allPossessions_ objectAtIndex:to + 1] orderingValue] doubleValue];
    }
    else {
        upperBound = [[[allPossessions_ objectAtIndex:to - 1] orderingValue] doubleValue] + 2.0;
    }
    
    NSNumber *n = [NSNumber numberWithDouble:(lowerBound + upperBound) / 2.0];

    NSLog(@"moving to order %@", n);
    [p setOrderingValue:n];
    
    [p release];
}

- (NSArray *)allAssetTypes {
    if (!allAssetTypes_) {
        NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
        NSEntityDescription *e = [[model_ entitiesByName] objectForKey:@"AssetType"];
        [request setEntity:e];
        
        NSError *error = nil;
        NSArray *result = [context_ executeFetchRequest:request error:&error];
        if (!result) {
            [NSException raise:@"Fetch failed"
                        format:@"Reason: %@", [error localizedDescription]];
        }
        allAssetTypes_ = [result mutableCopy];
    }
    
    if ([allAssetTypes_ count] == 0) {
        NSManagedObject *type = [NSEntityDescription insertNewObjectForEntityForName:@"AssetType"
                                                              inManagedObjectContext:context_];
        [type setValue:@"Jewelry" forKey:@"label"];
        [allAssetTypes_ addObject:type];
        
        type = [NSEntityDescription insertNewObjectForEntityForName:@"AssetType"
                                             inManagedObjectContext:context_];
        [type setValue:@"Electronics" forKey:@"label"];
        [allAssetTypes_ addObject:type];
    }
    
    return allAssetTypes_;
}

- (NSString *)possessionArchivePath {
    return PathInDocumentDirectory(@"possessions.data");
}

- (BOOL)saveChange {
    NSError *error = nil;
    BOOL successful = [context_ save:&error];
    if (!successful) {
        NSLog(@"Error saving: %@", [error localizedDescription]);
    }
    
    return successful;
}

- (void)fetchPossessionsIfNecessary {
    if (!allPossessions_) {
        NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
        
        NSEntityDescription *e = [[model_ entitiesByName] objectForKey:@"Possession"];
        [request setEntity:e];
        
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"orderingValue"
                                                             ascending:YES];
        [request setSortDescriptors:[NSArray arrayWithObject:sd]];
        
        NSError *error = nil;
        NSArray *result = [context_ executeFetchRequest:request error:&error];
        if (!result) {
            [NSException raise:@"Fetch failed"
                        format:@"Reason: %@", [error localizedDescription]];
        }
        
        allPossessions_ = [[NSMutableArray alloc] initWithArray:result];
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
