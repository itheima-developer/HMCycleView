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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // ---------- 需要轮播的view ----------
    UIImageView *view1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header"]];

    UIButton *view2 = [[UIButton alloc] init];
    [view2 setTitle:@"这是一个button" forState:UIControlStateNormal];
    [view2 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];

    UIImageView *view3 = [[UIImageView alloc] init];
    view3.image = [UIImage imageNamed:@"headers"];

    UILabel *view4 = [[UILabel alloc] init];
    view4.textAlignment = NSTextAlignmentCenter;
    view4.text = @"这是一个label";
    // ---------- 需要轮播的view ----------

    // 1. 创建cycleView
    HMCycleView *cycleView = [[HMCycleView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 200)];
    cycleView.backgroundColor = [UIColor whiteColor];

    // 2. 把所有需要轮播的view放在数组中
    cycleView.itemViews = @[ view1, view2, view3, view4 ];

    // 3. 设置轮播下一张的时间(可选，默认两秒)
    cycleView.duration = 3;

    // 4. 调用showInView的方法现实在某个view上
    [cycleView showInView:self.view];
}

@end
