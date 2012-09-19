//
//  FileHelpers.m
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 19..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import "Util/FileHelpers.h"

NSString* pathInDocumentDirectory(NSString *fileName) {
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:fileName];
}
