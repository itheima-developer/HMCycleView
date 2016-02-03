//
//  YHCycleView.h
//  YHCycleView
//
//  Created by HaoYoson on 16/1/29.
//  Copyright © 2016年 YosonHao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHCycleView : UICollectionView

/**
 *  需要轮播的view数组
 */
@property (strong, nonatomic) NSArray *itemViews;

/**
 *  多长时间轮播一次 默认2秒
 */
@property (assign, nonatomic) NSTimeInterval duration;

- (void)showInView:(UIView *)view;

@end
