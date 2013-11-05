//
//  ScrollViewTestAppDelegate.h
//  ScrollViewTest
//
//  Created by silentcloud on 11/2/13.
//  Copyright (c) 2013 qiang.mou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainViewController;

@interface ScrollViewTestAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) MainViewController *homeView;

-(void)loadMainView;

@end
