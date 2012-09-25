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
