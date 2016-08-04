//
//  HMCycleCell.m
//  01-图片轮播器
//
//  Created by heima on 16/7/4.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "HMCycleCell.h"

@interface HMCycleCell ()

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation HMCycleCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [self setupUI];
}

// set数据的方法
- (void)setImageURL:(NSURL *)imageURL {
    _imageURL = imageURL;

    // url ->  data
    NSData *data = [NSData dataWithContentsOfURL:imageURL];
    // data -> image
    UIImage *image = [UIImage imageWithData:data];

    self.imageView.image = image;
}

- (void)setupUI {
    // 创建imageView显示图片
    UIImageView *imageView = [[UIImageView alloc] init];

    // 把多余的部分剪切掉
    imageView.clipsToBounds = YES;
    [self.contentView addSubview:imageView];

    // 自动布局
    imageView.translatesAutoresizingMaskIntoConstraints = NO;    // 取消 autoresizing
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];

    self.imageView = imageView;
}

@end
