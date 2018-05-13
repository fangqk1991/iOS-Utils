//
//  DialogListVC.m
//  FC-Utils_Example
//
//  Created by fang on 2018/5/13.
//  Copyright © 2018 fangqk1991. All rights reserved.
//

#import "DialogListVC.h"
#import "FCInputView.h"

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
                                [dialog showInView:weakSelf submit:^(NSString *text) {
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
                                [dialog showInView:weakSelf submit:^(NSString *text) {
                                    NSLog(@"%@", text);
                                }];
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
