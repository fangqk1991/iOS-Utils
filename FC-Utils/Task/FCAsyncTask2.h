//
//  FCAsyncTask2.h
//  FC-Utils
//
//  Created by fang on 2018/5/23.
//

#import <Foundation/Foundation.h>

@interface FCAsyncTask2 : NSOperation

- (id)doInBackground;
- (void)onPostExecute:(id)result;
- (void)onPreExecute;

- (void)execute;

@end
