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
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(clearCache:)
               name:UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
    
    return self;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key {
    [dictionary_ setObject:image forKey:key];
    
    NSString *imagePath = pathInDocumentDirectory(key);
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    [data writeToFile:imagePath atomically:YES];
}

- (UIImage *)imageForKey:(NSString *)key {
    UIImage *result = [dictionary_ objectForKey:key];
    if (!result) {
        result = [UIImage imageWithContentsOfFile:pathInDocumentDirectory(key)];
        if (result) {
            [dictionary_ setObject:result forKey:key];
        }
        else {
            NSLog(@"Error: unable to find %@", pathInDocumentDirectory(key));
        }
    }
    return result;
}

- (void)deleteImageForKey:(NSString *)key {
    if (!key) {
        return;
    }
    [dictionary_ removeObjectForKey:key];
    
    NSString *imagePath = pathInDocumentDirectory(key);
    [[NSFileManager defaultManager] removeItemAtPath:imagePath error:nil];
}

- (void)clearCache:(NSNotification *)notification {
    NSLog(@"flushing %d images out of the cache", [dictionary_ count]);
    [dictionary_ removeAllObjects];
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
