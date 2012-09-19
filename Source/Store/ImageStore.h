//
//  ImageStore.h
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 18..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageStore : NSObject {
    NSMutableDictionary *dictionary_;
}

+ (ImageStore *)defaultImageStore;

- (void)setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;

- (void)clearCache:(NSNotification *)notification;

@end
