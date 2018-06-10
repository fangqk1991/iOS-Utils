//
//  NSDate+String.m
//  FC-Utils
//
//  Created by fang on 2018/6/10.
//

#import "NSDate+String.h"

@implementation NSDate(String)

- (NSString *)dateStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    return [dateFormatter stringFromDate:self];
}

+ (NSDate *)dateWithStr:(NSString *)str
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    return [dateFormatter dateFromString:str];
}

- (int)compareWithDate:(NSDate *)date
{
    return [NSDate compareDate1:self date2:date];
}

+ (int)compareDate1:(NSDate *)oneDate date2:(NSDate *)anotherDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDate];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDate];
    NSDate *date1 = [dateFormatter dateFromString:oneDayStr];
    NSDate *date2 = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [date1 compare:date2];

    if (result == NSOrderedDescending) {
        return -1;
    }
    else if (result == NSOrderedAscending) {
        return 1;
    }
    
    return 0;
}

@end
