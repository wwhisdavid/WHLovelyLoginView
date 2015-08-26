//
//  ViewController.m
//  WHLovelyLoginViewDemo
//
//  Created by deyi on 15/8/26.
//  Copyright (c) 2015年 deyi. All rights reserved.
//

#import "ViewController.h"
#import "WHLovelyLoginView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WHLovelyLoginView *view = [[WHLovelyLoginView alloc] init];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
