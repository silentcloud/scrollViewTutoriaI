//
//  MainViewController.m
//  ScrollViewTest
//
//  Created by silentcloud on 11/2/13.
//  Copyright (c) 2013 qiang.mou. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    label.text = @"Main view";
    
    [self.view addSubview:label];
    
}

@end
