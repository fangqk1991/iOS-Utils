//
//  FCAsyncTask.m
//  FC-Utils
//
//  Created by fang on 2018/5/23.
//

#import "FCAsyncTask.h"
#import "FCTaskQueue.h"

@implementation FCAsyncTask

- (instancetype)init
{
    self = [super init];
    if (self != nil)
    {
    }
    return self;
}

- (void)updateProgress:(NSUInteger)current total:(NSUInteger)total
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.onProgressUpdateBlock)
        {
            self.onProgressUpdateBlock(current, total);
        }
    });
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
    if(self.doInBackgroundBlock == nil)
    {
        [NSException raise:NSInvalidArgumentException format:@"You must assign doInBackgroundBlock"];
    }
    
    if (self.isCancelled)
    {
        [self onCancelled];
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.onPreExecuteBlock)
        {
            self.onPreExecuteBlock();
        }
    });
    
    id result = nil;
    FCTaskException *exception = nil;
    
    @try {
        result = self.doInBackgroundBlock(self);
    } @catch (FCTaskException *e) {
        exception = e;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if(exception)
        {
            if(self.onFailureBlock)
            {
                self.onFailureBlock(exception);
            }
        }
        else
        {
            if(self.onPostExecuteBlock)
            {
                self.onPostExecuteBlock(result);
            }
        }
    });
}

- (void)dealloc
{
    NSLog(@"---------- %@ - %@ ----------", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

@end
