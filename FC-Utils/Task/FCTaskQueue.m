//
//  FCTaskQueue.m
//  FC-Utils
//
//  Created by fang on 2018/5/23.
//

#import "FCTaskQueue.h"
#import "FCAsyncTask.h"

@interface FCTaskQueue()

@property (strong, nonatomic) NSOperationQueue *taskQueue;

@end

@implementation FCTaskQueue

+ (instancetype) getInstance
{
    static FCTaskQueue * instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [[self class] getInstance];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [[self class] getInstance];
}

- (id)init
{
    self = [super init];
    if(self)
    {
        _taskQueue = [[NSOperationQueue alloc] init];
        [_taskQueue setMaxConcurrentOperationCount:1];
        
    }
    return self;
}

- (void)addOperation:(FCAsyncTask *)task
{
    [_taskQueue addOperation:task];
}

- (void)dealloc
{
    [_taskQueue cancelAllOperations];
}

@end
