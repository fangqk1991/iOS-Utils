//
//  NSDate+String.h
//  FC-Utils
//
//  Created by fang on 2018/6/10.
//

#import <Foundation/Foundation.h>

@interface NSDate(String)

- (NSString *)dateStr;
+ (NSDate *)dateWithStr:(NSString *)str;
- (int)compareWithDate:(NSDate *)date;

@end
