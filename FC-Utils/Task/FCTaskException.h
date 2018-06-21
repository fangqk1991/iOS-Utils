//
//  FCTaskException.h
//  FC-Utils
//
//  Created by fang on 2018/6/21.
//

#import <Foundation/Foundation.h>

@interface FCTaskException : NSException

+ (void)fc_raise:(NSString *)format, ...;

@end
