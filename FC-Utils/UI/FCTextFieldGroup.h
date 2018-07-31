//
//  FCTextFieldGroup.h
//  FC-Utils
//
//  Created by fang on 2018/6/9.
//

#import <Foundation/Foundation.h>

@interface FCTextFieldGroup : NSObject

- (instancetype)initWithTextFields:(NSArray *)textFields onLastReturn:(void(^)(void))onLastReturn;

@end
