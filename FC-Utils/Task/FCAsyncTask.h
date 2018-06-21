//
//  FCAsyncTask.h
//  FC-Utils
//
//  Created by fang on 2018/5/23.
//

#import <Foundation/Foundation.h>
#import "FCTaskException.h"

@class FCAsyncTask;

typedef void (^FCTaskOnPreExecute)(void);
typedef void (^FCTaskOnProgressUpdate)(NSUInteger current, NSUInteger total);
typedef void (^FCTaskOnPostExecute)(id result);
typedef void (^FCTaskOnFailure)(FCTaskException *exception);

typedef id (^FCTaskOnBackground)(FCAsyncTask *_self);

@interface FCAsyncTask : NSOperation

@property (nonatomic, copy) FCTaskOnPreExecute onPreExecuteBlock;
@property (nonatomic, copy) FCTaskOnProgressUpdate onProgressUpdateBlock;
@property (nonatomic, copy) FCTaskOnPostExecute onPostExecuteBlock;
@property (nonatomic, copy) FCTaskOnFailure onFailureBlock;
@property (nonatomic, copy) FCTaskOnBackground doInBackgroundBlock;

- (void)updateProgress:(NSUInteger)current total:(NSUInteger)total;

- (void)execute;

@end
