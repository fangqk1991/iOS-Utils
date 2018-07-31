//
//  FCInputGroupVC.m
//  FC-Utils_Example
//
//  Created by fang on 2018/6/9.
//  Copyright © 2018 fangqk1991. All rights reserved.
//

#import "FCViewVC.h"
#import "FCView.h"
#import "FCToast.h"

@interface FCViewVC ()

@property (nonatomic, weak) IBOutlet FCView *myView;

@end

@implementation FCViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_myView setOnClick:^(FCView *sender) {
        [FCToast toast:@"on tap.."];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
