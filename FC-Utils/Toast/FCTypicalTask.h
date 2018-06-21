//
//  FCTypicalTask.h
//  FC-Utils
//
//  Created by fang on 2018/5/23.
//

#import "FCAsyncTask2.h"
#import <UIKit/UIKit.h>

@interface FCTypicalTask : FCAsyncTask2

@property (nonatomic, strong) NSString *hint;

- (instancetype)initWithView:(UIView *)view;
- (void)onProgressUpdateHint:(NSString *)hint;
- (void)onProgressUpdateCurrent:(NSUInteger)current total:(NSUInteger)total;

@end
