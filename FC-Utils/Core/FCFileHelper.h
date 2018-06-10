//
//  FCFileHelper.h
//  FC-Utils
//
//  Created by fang on 2018/6/10.
//

#import <Foundation/Foundation.h>

@interface FCFileHelper : NSObject

+ (NSString *)documentsDir;
+ (NSString *)cachesDir;
+ (NSString *)tempDir;
+ (BOOL)createDir:(NSString *)path;
+ (void)removeFile:(NSString *)filePath;

@end
