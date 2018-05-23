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
        self.hint = @"Loading";
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
    _hud = [MBProgressHUD showHUDAddedTo:_view animated:YES];
    _hud.mode = MBProgressHUDModeIndeterminate;
    _hud.detailsLabel.text = _hint;
    
    self.view = nil;
}

- (void)onProgressUpdateCurrent:(NSUInteger)current total:(NSUInteger)total
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.hud.detailsLabel.text = [NSString stringWithFormat:@"Waiting %@/%@", @(current), @(total)];
    });
}

@end
