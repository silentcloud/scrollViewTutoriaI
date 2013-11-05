//
//  ViewController.m
//  ScrollViewTest
//
//  Created by silentcloud on 11/2/13.
//  Copyright (c) 2013 qiang.mou. All rights reserved.
//
#import "ScrollViewTestAppDelegate.h"
#import "ViewController.h"

@implementation ViewController

#define SCREEN_WIDTH self.view.bounds.size.width
#define SCREEN_HEIGHT self.view.bounds.size.height

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 4, SCREEN_HEIGHT);
    [self.view addSubview:_scrollView];

    int _x = 0;
    for (int index = 0; index < 4; index++) {
        UIImageView *imgScrollView = [[UIImageView alloc] initWithFrame:CGRectMake(0+_x, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        imgScrollView.tag = index;
        NSString *imgName = [NSString stringWithFormat:@"guide0%d.png", index + 1];
        imgScrollView.image = [UIImage imageNamed:imgName];
        [_scrollView addSubview:imgScrollView];
        _x += SCREEN_WIDTH;
    }
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, 50)];
    _pageControl.numberOfPages = 4;
    [self.view addSubview:_pageControl];
    
    UIButton *skipBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 60, SCREEN_HEIGHT - 40, 40, 20)];
    [skipBtn setTitle:@"Skip" forState:UIControlStateNormal];
    [self.view addSubview:skipBtn];
    
    [skipBtn addTarget:self action:@selector(goMainView) forControlEvents:UIControlEventTouchUpInside];
    //[skipBtn addTarget:self action:@selector(launch) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x > SCREEN_WIDTH * 3) {
        [self goMainView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int current = scrollView.contentOffset.x / 320;
    _pageControl.currentPage = current;
    [_pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
}

-(IBAction)changePage:(id)sender
{
    int page = _pageControl.currentPage;
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH* page, 0)];
}

-(void)goMainView
{
    self.view = nil;
    [(ScrollViewTestAppDelegate *)[UIApplication sharedApplication].delegate loadMainView];
}

@end
