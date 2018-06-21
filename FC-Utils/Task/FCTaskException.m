//
//  FCTaskException.m
//  FC-Utils
//
//  Created by fang on 2018/6/21.
//

#import "FCTaskException.h"

@implementation FCTaskException

+ (void)fc_raise:(NSString *)format, ...
{
    va_list args;
    va_start(args, format);
    NSString *reason = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    [FCTaskException raise:NSGenericException format:@"%@", reason];
}

@end
