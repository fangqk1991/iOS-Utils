//
//  FCAsyncTask2.m
//  FC-Utils
//
//  Created by fang on 2018/5/23.
//

#import "FCAsyncTask2.h"
#import "FCTaskQueue.h"

@implementation FCAsyncTask2

- (instancetype)init
{
    self = [super init];
    if (self != nil)
    {
    }
    return self;
}

- (void)onPreExecute
{
}

- (id)doInBackground
{
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    return nil;
}

- (void)onPostExecute:(id)result
{
}

- (void)onFailure:(FCTaskException *)exception
{
}

- (void)onCancelled
{
}

- (void)execute
{
    [[FCTaskQueue getInstance] addOperation:self];
}

- (void)main
{
    if (self.isCancelled)
    {
        [self onCancelled];
        
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self onPreExecute];
    });
    
    id result = nil;
    FCTaskException *exception = nil;
    
    @try {
        result = [self doInBackground];
    } @catch (FCTaskException *e) {
        exception = e;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if(exception)
        {
            [self onFailure:exception];
        }
        else
        {
            [self onPostExecute:result];
        }
    });
}

- (void)dealloc
{
    NSLog(@"---------- %@ - %@ ----------", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

@end
