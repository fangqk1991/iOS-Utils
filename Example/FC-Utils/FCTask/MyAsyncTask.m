//
//  MyAsyncTask.m
//  FC-Utils_Example
//
//  Created by fang on 2018/5/23.
//  Copyright © 2018 fangqk1991. All rights reserved.
//

#import "MyAsyncTask.h"
#import "NSLogger.h"
#import "FCTaskException.h"
#import "FCToast.h"

@implementation MyAsyncTask

- (id)doInBackground
{
    if(_testException)
    {
        [FCTaskException fc_raise:@"[%@] raise.", NSStringFromSelector(_cmd)];
    }
    
    LoggerApp(3, @"doInBackground");
    for(int i = 0; i < 10; ++i)
    {
        [self onProgressUpdateCurrent:i total:10];
        sleep(1);
    }
    
    [self onProgressUpdateHint:@"即将完成."];
    sleep(1);
    
    return nil;
}

- (void)onFailure:(FCTaskException *)exception
{
    [super onFailure:exception];
    [FCToast toast:exception.reason];
}

@end
