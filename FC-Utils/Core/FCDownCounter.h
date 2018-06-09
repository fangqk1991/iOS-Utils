//
//  FCDownCounter.h
//  FC-Utils
//
//  Created by fang on 2018/6/9.
//

#import <Foundation/Foundation.h>

@interface FCDownCounter : NSObject

- (void)setTotalSeconds:(NSUInteger)totalSeconds;
- (void)setTotalSeconds:(NSUInteger)totalSeconds step:(CGFloat)step;
- (void)reset;
- (void)startWithStepCallback:(void(^)(CGFloat remain))stepCallback doneCallback:(void(^)(void))doneCallback;

@end
