//
//  FCInputGroupVC.m
//  FC-Utils_Example
//
//  Created by fang on 2018/6/9.
//  Copyright © 2018 fangqk1991. All rights reserved.
//

#import "FCInputGroupVC.h"
#import "FCTextFieldGroup.h"

@interface FCInputGroupVC ()

@property (nonatomic, strong) IBOutletCollection(UITextField) NSArray *textFieldCollection;
@property (nonatomic, strong) FCTextFieldGroup *inputHelper;

@end

@implementation FCInputGroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.inputHelper = [[FCTextFieldGroup alloc] initWithTextFields:self.textFieldCollection onLastReturn:^{
        NSLog(@"onLastReturn");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
