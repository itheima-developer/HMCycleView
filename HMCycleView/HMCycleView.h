//
//  HMCycleView.h
//  HMCycleView
//
//  Created by HaoYoson on 16/1/29.
//  Copyright © 2016年 YosonHao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMCycleView;

@protocol HMCycleViewDelegate <NSObject>

@optional
// 点击时间 - 自己，点击的view，点击的view在数组中的位置。
- (void)cycleView:(HMCycleView *)cycleView didSelectItemView:(UIView *)itemView atIndex:(NSInteger)index;

@end

@interface HMCycleView : UICollectionView

/**
 *  需要轮播的view数组
 */
@property (strong, nonatomic) NSArray *itemViews;

/**
 *  多长时间轮播一次 默认2秒
 */
@property (assign, nonatomic) NSTimeInterval duration;

@property (weak, nonatomic) id<HMCycleViewDelegate> cycleViewDelegate;

-(void)start;

@end
