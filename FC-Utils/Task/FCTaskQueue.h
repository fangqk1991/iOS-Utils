//
//  FCTaskQueue.h
//  FC-Utils
//
//  Created by fang on 2018/5/23.
//

#import <Foundation/Foundation.h>

@class FCAsyncTask;

@interface FCTaskQueue : NSObject

+ (instancetype)getInstance;
- (void)addOperation:(FCAsyncTask *)task;

@end
