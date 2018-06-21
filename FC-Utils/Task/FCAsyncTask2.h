//
//  FCAsyncTask2.h
//  FC-Utils
//
//  Created by fang on 2018/5/23.
//

#import <Foundation/Foundation.h>
#import "FCTaskException.h"

@interface FCAsyncTask2 : NSOperation

- (void)onPreExecute;
- (id)doInBackground;
- (void)onPostExecute:(id)result;
- (void)onFailure:(FCTaskException *)exception;

- (void)execute;

@end
