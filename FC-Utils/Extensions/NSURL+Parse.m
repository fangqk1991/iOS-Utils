//
//  NSURL+Parse.m
//  FC-Utils
//
//  Created by fang on 2018/8/6.
//

#import "NSURL+Parse.h"

@implementation NSURL(Parse)

- (NSDictionary *)queryParams
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    for (NSString *entity in [self.query componentsSeparatedByString:@"&"]) {
        NSArray *elts = [entity componentsSeparatedByString:@"="];
        if([elts count] < 2) continue;
        [params setObject:[elts lastObject] forKey:[elts firstObject]];
    }
    
    return params;
}

@end
