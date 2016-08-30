//
//  HMCycleView.m
//  HMCycleView
//
//  Created by HaoYoson on 16/1/29.
//  Copyright © 2016年 YosonHao. All rights reserved.
//

#import "HMCycleView.h"

#pragma mark - HMCycleCell

@interface HMCycleCell : UICollectionViewCell

@property (nonatomic, weak) UIImageView *imageView;

@property (nonatomic, strong) NSURL *imageURL;

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

#pragma mark - HMCycleFlowLayout

@interface HMCycleFlowLayout : UICollectionViewFlowLayout

@end

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

#pragma mark - NSTimer (Addition)

@interface NSTimer (Addition)

/**
 *  暂定当前时间对象
 */
- (void)pauseTimer;

/**
 * 当前时间对象
 */
- (void)resumeTimer;

/**
 *  一定时间后恢复定时器对象
 *
 *  @param interval 时间
 */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;
@end

@implementation NSTimer (Addition)

- (void)pauseTimer {
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate distantFuture]];
}

- (void)resumeTimer {
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval {
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end

#pragma mark - HMCycleView

#define kSeed 99

// 标示符
static NSString *const reuseIdentifier = @"cycle_cell";

@interface HMCycleView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, weak) UIPageControl *pageControl;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation HMCycleView

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

- (void)setupUI {
    // 子控件
    HMCycleFlowLayout *layout = [[HMCycleFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    // 设置数据源和代理
    collectionView.dataSource = self;
    collectionView.delegate = self;
    // 注册单元格
    [collectionView registerClass:[HMCycleCell class] forCellWithReuseIdentifier:reuseIdentifier];

    // 设置分页
    collectionView.pagingEnabled = YES;
    // 取消弹性效果
    collectionView.bounces = NO;
    // 取消指示器
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    // 添加到视图上
    [self addSubview:collectionView];

    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.currentPageIndicatorTintColor = [UIColor yellowColor];
    pageControl.pageIndicatorTintColor = [UIColor blueColor];
    pageControl.userInteractionEnabled = NO;
    [self addSubview:pageControl];

    // 自动布局
    collectionView.translatesAutoresizingMaskIntoConstraints = NO;    // 取消 autoresizing
    [self addConstraint:[NSLayoutConstraint constraintWithItem:collectionView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:collectionView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:collectionView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:collectionView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0]];

    // 自动布局
    pageControl.translatesAutoresizingMaskIntoConstraints = NO;    // 取消 autoresizing
    [self addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];

    self.collectionView = collectionView;
    self.pageControl = pageControl;
}

// 当图片数据传过来的时候一定会调用这个方法
- (void)setImageURLs:(NSArray *)imageURLs {
    _imageURLs = imageURLs;

    // 刷新数据(重新加载数据源)
    [self.collectionView reloadData];

    // 设置pageControl的总页数
    self.pageControl.numberOfPages = imageURLs.count;
}

// 已经显示
- (void)didMoveToWindow {
    [super didMoveToWindow];

    [self layoutIfNeeded];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.imageURLs.count * kSeed inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];

    // 设置一个时钟装置 创建一个计时器对象 把这个计时器添加到运行循环当中
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)updateTimer {
    // 获取当前的位置
    // 这个方法 表示 获取当前collectionView多有可见的cell的位置(indexPath)
    // 因为就我们这个轮播器而言,当前可见的cell只有一个,所以可以根据last 或者 first 或者 [0] 来获取
    NSIndexPath *indexPath = [self.collectionView indexPathsForVisibleItems].lastObject;

    // 根据当前页 创建下一页的位置
    NSIndexPath *nextPath = [NSIndexPath indexPathForItem:indexPath.item + 1 inSection:indexPath.section];

    [self.collectionView scrollToItemAtIndexPath:nextPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

// 开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.timer pauseTimer];
}

// 结束拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self.timer resumeTimerAfterTimeInterval:2];
}

// 滚动动画结束的时候调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    // 手动调用减速完成的方法
    [self scrollViewDidEndDecelerating:self.collectionView];
}

// 监听手动减速完成(停止滚动)
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // x 偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    // 计算页数
    NSInteger page = offsetX / self.bounds.size.width;

    // 获取某一组有多少行
    NSInteger itemsCount = [self.collectionView numberOfItemsInSection:0];

    if (page == 0) {    // 第一页
        self.collectionView.contentOffset = CGPointMake(offsetX + self.imageURLs.count * kSeed * self.bounds.size.width, 0);
    } else if (page == itemsCount - 1) {    // 最后一页
        self.collectionView.contentOffset = CGPointMake(offsetX - self.imageURLs.count * kSeed * self.bounds.size.width, 0);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;

    CGFloat page = offsetX / self.bounds.size.width + 0.5;
    page = (NSInteger)page % self.imageURLs.count;
    self.pageControl.currentPage = page;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageURLs.count * 2 * kSeed;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HMCycleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.imageURL = self.imageURLs[indexPath.item % self.imageURLs.count];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(cycleView:didSelectItemAtIndex:)]) {
        [self.delegate cycleView:self didSelectItemAtIndex:indexPath.item % self.imageURLs.count];
    }
}

- (void)removeFromSuperview {
    [super removeFromSuperview];
    [self.timer invalidate];
}

- (NSTimer *)timer {
    if (!_timer) {
        NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        _timer = timer;
    }
    return _timer;
}

@end
