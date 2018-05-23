//
//  FCTypicalTask.m
//  FC-Utils
//
//  Created by fang on 2018/5/23.
//

#import "FCTypicalTask.h"
#import "MBProgressHUD.h"

@interface FCTypicalTask()

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation FCTypicalTask

- (instancetype)initWithView:(UIView *)view
{
    self = [super init];
    if (self != nil)
    {
        self.view = view;
    }
    return self;
}

- (id)doInBackground
{
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    return nil;
}

- (void)onPostExecute:(id)result
{
    [_hud hideAnimated:YES];
}

- (void)onPreExecute
{
    UIView *view = _view;
    
    if(view == nil)
    {
        view = [[[UIApplication sharedApplication] delegate] window];
    }
    
    _hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    _hud.mode = MBProgressHUDModeIndeterminate;
    _hud.detailsLabel.text = _hint;
    
    self.view = nil;
}

- (void)onProgressUpdateCurrent:(NSUInteger)current total:(NSUInteger)total
{
    NSString *hint = _hint;
    if(hint == nil)
    {
        hint = @"Waiting";
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.hud.detailsLabel.text = [NSString stringWithFormat:@"%@ %@/%@", hint, @(current), @(total)];
    });
}

@end
