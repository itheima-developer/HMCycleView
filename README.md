# HMCycleView

HMCycleView is a open source iOS library provide infinity scroll show a group of views in view.

##Demo
===
Build and run the `HMCycleViewDemo` project in Xcode to see `HMCycleView` in action.

##Setup
===
To enable fantasitic feature in your project with the following simple steps:

1. Download the project from GitHub.
2. Drop `HMCycleView` files into your project.
3. Add `#include "HMCycleView.h"` to the top of classes that will use it.

##Usage
===
``` objective-c

    // 1. create cycleView
    // 1. 创建cycleView
    HMCycleView *cycleView = [[HMCycleView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 200)];
    cycleView.backgroundColor = [UIColor whiteColor];

    // 2. put a group of views in this array
    // 2. 把所有需要轮播的view放在数组中
    cycleView.itemViews = @[ view1, view2, view3, view4 ];

    // 3. set scroll time interval(Optional,The default is two seconds)
    // 3. 设置轮播下一张的时间(可选，默认两秒)
    cycleView.duration = 3;

    // 4. Call the showInView method to display
    // 4. 调用showInView的方法现实在某个view上
    [cycleView showInView:self.view];
```

##Author
===
**Yoson Hao**

Weibo:[@郝悦兴][1]

Github:[Hao Y.Xing][2]

##Thanks
===
**刀哥**

Github:[刘凡][3]

Blog:[Joy iOS][4]

[1]: http://weibo.com/haoyuexing
[2]: https://github.com/haoyuexing
[3]: https://github.com/liufan321
[4]: http://www.joyios.com/
