//
//  FCFileHelper.m
//  FC-Utils
//
//  Created by fang on 2018/6/10.
//

#import "FCFileHelper.h"

@implementation FCFileHelper

+ (NSString *)documentsDir
{
    static NSString *path = nil;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        path = [paths lastObject];
    });
    
    return path;
}

+ (NSString *)cachesDir
{
    static NSString *path = nil;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        path = [paths lastObject];
    });
    
    return path;
}

+ (NSString *)tempDir
{
    return NSTemporaryDirectory();
}

+ (BOOL)createDir:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path isDirectory:nil])
    {
        return NO;
    }
    else
    {
        return [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:NULL error:NULL];
    }
}

+ (void)removeFile:(NSString *)filePath
{
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
}

@end
