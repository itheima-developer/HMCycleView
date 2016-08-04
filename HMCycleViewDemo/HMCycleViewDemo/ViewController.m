//
//  ViewController.m
//  HMCycleViewDemo
//
//  Created by HaoYoson on 16/2/3.
//  Copyright © 2016年 YosonHao. All rights reserved.
//

#import "HMCycleView.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor whiteColor];

    // 1. create cycleView(set 'frame' or 'autoLayout').
    HMCycleView *cycleView = [[HMCycleView alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];

    NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"Home_Scroll_01.jpg" withExtension:nil];
    NSURL *url2 = [[NSBundle mainBundle] URLForResource:@"Home_Scroll_02.jpg" withExtension:nil];
    NSURL *url3 = [[NSBundle mainBundle] URLForResource:@"Home_Scroll_03.jpg" withExtension:nil];
    NSURL *url4 = [[NSBundle mainBundle] URLForResource:@"Home_Scroll_04.jpg" withExtension:nil];
    NSURL *url5 = [[NSBundle mainBundle] URLForResource:@"Home_Scroll_05.jpg" withExtension:nil];
    // 2. set array with image's URL.
    cycleView.imageURLs = @[ url1, url2, url3, url4, url5 ];

    // 3. add this cycleView.
    [self.view addSubview:cycleView];

    cycleView.translatesAutoresizingMaskIntoConstraints = NO;    // 取消 autoresizing
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:cycleView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:cycleView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:cycleView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:cycleView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:150]];
}

// 轮播器广告数据
- (NSArray *)loadImageURLs {
    NSMutableArray *array = [NSMutableArray array];

    for (int i = 0; i < 5; i++) {
        NSString *imageName = [NSString stringWithFormat:@"Home_Scroll_0%d.jpg", i + 1];

        // 获取图片的url
        NSURL *url = [[NSBundle mainBundle] URLForResource:imageName withExtension:nil];

        [array addObject:url];
    }

    return array.copy;
}

@end
