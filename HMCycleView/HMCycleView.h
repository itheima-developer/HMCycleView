//
//  HMCycleView.h
//  HMCycleView
//
//  Created by HaoYoson on 16/1/29.
//  Copyright © 2016年 YosonHao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMCycleView;

typedef enum : NSUInteger {
    HMCycleViewPageControlPositionBottomRight,
    HMCycleViewPageControlPositionBottomLeft,
    HMCycleViewPageControlPositionBottomCenter,
} HMCycleViewPageControlPosition;

@protocol HMCycleViewDelegate <NSObject>

@optional
// 点击事件 - 自己，点击的view，点击的view在数组中的位置。
- (void)cycleView:(HMCycleView *)cycleView didSelectItemAtIndex:(NSInteger)index;

@end

@interface HMCycleView : UIView

// 图片URL地址的数组
@property (nonatomic, strong) NSArray<NSURL *> *imageURLs;

@property (weak, nonatomic) id<HMCycleViewDelegate> delegate;

@property (assign, nonatomic) BOOL showPageControl;

@property (assign, nonatomic) HMCycleViewPageControlPosition pageControlPosition;

@property (nonatomic, strong) NSArray<NSString *> *titles;

@end
