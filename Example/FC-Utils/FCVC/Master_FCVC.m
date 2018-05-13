//
//  Master_FCVC.m
//  FC-Utils_Example
//
//  Created by fang on 2018/5/13.
//  Copyright © 2018 fangqk1991. All rights reserved.
//

#import "Master_FCVC.h"
#import "FromXib_FCVC.h"

@interface Master_FCVC ()<UITableViewDelegate>

@property (strong, nonatomic) NSArray *infos;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation Master_FCVC

static NSString * const kReuseCell = @"ReuseCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __weak __typeof(self)weakSelf = self;

    _infos = @[
            @[
                    @{
                            @"text": @"FromXib_FCVC",
                            @"event": ^{ [FromXib_FCVC fc_pushToNavigation:weakSelf.navigationController]; }
                    },
                    @{
                            @"text": @"FromSB_FCVC",
                            @"event": ^{ [Master_FCVC fc_pushToNavigation:weakSelf.navigationController]; }
                    },
            ]
    ];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kReuseCell];

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
