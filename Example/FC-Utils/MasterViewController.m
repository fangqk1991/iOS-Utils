//
//  MasterViewController.m
//  FC-Utils_Example
//
//  Created by fang on 2018/5/13.
//  Copyright © 2018 fangqk1991. All rights reserved.
//

#import "MasterViewController.h"
#import "FCDialog.h"

@interface MasterViewController ()

@property (strong, nonatomic) NSArray *infos;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    __weak __typeof(self)weakSelf = self;

    _infos = @[
            @[
                    @{
                            @"text": @"FCDialog",
                            @"event": ^{ [FCDialog showSingleTextInputDialogInView:weakSelf title:@"FCDialog" submit:nil]; }
                    },
                    @{
                            @"text": @"支付宝",
                            @"event": ^{}
                    },
            ],
    ];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
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
