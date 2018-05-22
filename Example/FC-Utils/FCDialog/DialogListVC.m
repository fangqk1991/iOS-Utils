//
//  DialogListVC.m
//  FC-Utils_Example
//
//  Created by fang on 2018/5/13.
//  Copyright © 2018 fangqk1991. All rights reserved.
//

#import "DialogListVC.h"
#import "FCInputView.h"
#import "FCAlertView.h"
#import "FCActionView.h"

@interface DialogListVC ()<UITableViewDelegate>

@property (strong, nonatomic) NSArray *infos;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DialogListVC

static NSString * const kReuseCell = @"ReuseCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __weak __typeof(self)weakSelf = self;

    _infos = @[
               @[
                   @{
                       @"text": @"Input Text",
                       @"event":
                           ^ {
                               FCInputView *dialog = [FCInputView dialogWithTitle:@"请输入文字"];
                               [dialog showInVC:weakSelf submit:^(NSString *text) {
                                   NSLog(@"%@", text);
                               }];
                           }
                       },
                   @{
                       @"text": @"Input Number",
                       @"event":
                           ^ {
                               FCInputView *dialog = [FCInputView dialogWithTitle:@"请输入数字"];
                               dialog.keyboardType = UIKeyboardTypeDecimalPad;
                               [dialog showInVC:weakSelf submit:^(NSString *text) {
                                   NSLog(@"%@", text);
                               }];
                           }
                       },
                   @{
                       @"text": @"Normal Alert",
                       @"event":
                           ^ {
                               [FCAlertView confirmInVC:weakSelf message:@"Normal Alert" block:^{
                                   NSLog(@"Normal Alert");
                               }];
                           }
                       },
                   @{
                       @"text": @"Not cancelable Alert",
                       @"event":
                           ^ {
                               [FCAlertView alertInVC:weakSelf message:@"Not cancelable Alert"];
                           }
                       },
                   @{
                       @"text": @"ActionSheet",
                       @"event":
                           ^ {
                               FCActionView *dialog = [FCActionView dialogWithTitle:@"请选择"];
                               dialog.cancelable = YES;
                               
                               [dialog addAction:@"A" handler:^(UIAlertAction *action) {
                                   [FCAlertView alertInVC:weakSelf message:@"A"];
                               }];
                               [dialog addAction:@"B" handler:^(UIAlertAction *action) {
                                   [FCAlertView alertInVC:weakSelf message:@"B"];
                               }];
                               [dialog showInVC:weakSelf];
                           }
                       },
                   ]
               ];

    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kReuseCell];
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _infos.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = _infos[section];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseCell forIndexPath:indexPath];
    
    NSArray *array = _infos[indexPath.section];
    NSDictionary *info = array[indexPath.row];
    cell.textLabel.text = info[@"text"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *array = _infos[indexPath.section];
    NSDictionary *info = array[indexPath.row];
    
    void (^handler)(void) = info[@"event"];
    if(handler)
    {
        handler();
    }
}

@end
