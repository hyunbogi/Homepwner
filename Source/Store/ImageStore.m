//
//  ImageStore.m
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 18..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import "Store/ImageStore.h"

static ImageStore *defaultImageStore_ = nil;

@implementation ImageStore

+ (ImageStore *)defaultImageStore {
    if (!defaultImageStore_) {
        defaultImageStore_ = [[super allocWithZone:nil] init];
    }
    return defaultImageStore_;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [self defaultImageStore];
}

- (id)init {
    if (defaultImageStore_) {
        return defaultImageStore_;
    }
    
    self = [super init];
    if (self) {
        dictionary_ = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key {
    [dictionary_ setObject:image forKey:key];
}

- (UIImage *)imageForKey:(NSString *)key {
    return [dictionary_ objectForKey:key];
}

- (void)deleteImageForKey:(NSString *)key {
    if (!key) {
        return;
    }
    [dictionary_ removeObjectForKey:key];
}

- (oneway void)release {
    // do nothing
}

- (id)autorelease {
    return self;
}

- (id)retain {
    return self;
}

- (NSUInteger)retainCount {
    return NSUIntegerMax;
}

@end
