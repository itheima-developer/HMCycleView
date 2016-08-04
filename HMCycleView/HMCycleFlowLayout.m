//
//  HMCycleFlowLayout.m
//  01-图片轮播器
//
//  Created by heima on 16/7/4.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "HMCycleFlowLayout.h"

@implementation HMCycleFlowLayout

- (void)prepareLayout {
    [super prepareLayout];

    self.itemSize = self.collectionView.bounds.size;

    // 间距
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;

    // 滚动方法
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

@end
