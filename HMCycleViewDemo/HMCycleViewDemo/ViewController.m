//
//  ViewController.m
//  HMCycleViewDemo
//
//  Created by HaoYoson on 16/2/3.
//  Copyright © 2016年 YosonHao. All rights reserved.
//

#import "HMCycleView.h"
#import "ViewController.h"

@interface ViewController () <HMCycleViewDelegate>
@property (weak, nonatomic) IBOutlet HMCycleView *cycleViewStoryboard;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 获取需要加载的数组
    NSArray *itemViews = [self loadItemViews];

    // codeDemo
    [self codeDemo:itemViews];

    // storyboardDemo
    //    [self storyboardDemo:itemViews];
}

- (void)codeDemo:(NSArray *)itemViews
{
    // 1. 创建cycleView
    HMCycleView *cycleViewCode = [[HMCycleView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 200)];

    cycleViewCode.backgroundColor = [UIColor whiteColor];

    // 2. 把所有需要轮播的view放在数组中
    cycleViewCode.itemViews = itemViews;

    // *设置轮播下一张的时间(可选，默认两秒)
    cycleViewCode.duration = 3;

    // *设置代理(可选，用于监听点击事件)
    cycleViewCode.cycleViewDelegate = self;

    // 添加到控制器view上
    [self.view addSubview:cycleViewCode];
}

- (void)storyboardDemo:(NSArray *)itemViews
{
    // 1.在storyboard中拖一个 "UIView"

    // 2.在这个 view 的 custom class 中绑定 "HMCycleView"

    // 3.在代码中设置需要轮播的数组
    self.cycleViewStoryboard.itemViews = itemViews;

    // *设置轮播下一张的时间(可选，默认两秒)
    self.cycleViewStoryboard.duration = 3;

    // *设置代理(可选，用于监听点击事件)
    self.cycleViewStoryboard.cycleViewDelegate = self;
}

// ---------- 需要轮播的view ----------
- (NSArray *)loadItemViews
{
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
    return @[ view1, view2, view3, view4 ];
}

// 点击事件的代理方法
- (void)cycleView:(HMCycleView *)cycleView didSelectItemView:(UIView *)itemView atIndex:(NSInteger)index
{
    NSLog(@"%@", itemView);
    NSLog(@"%zd", index);
}

@end
