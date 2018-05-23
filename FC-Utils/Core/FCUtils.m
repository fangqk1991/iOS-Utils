//
//  FCUtils.m
//  FC-Utils
//
//  Created by fang on 2018/5/23.
//

#import "FCUtils.h"

@implementation FCUtils

+ (NSString *)getAppVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString *)getSystemVersion
{
    return [NSString stringWithFormat:@"%.1f", [[UIDevice currentDevice].systemVersion floatValue]];
}

@end
