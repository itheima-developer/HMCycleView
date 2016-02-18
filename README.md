# HMCycleView
HMCycleView is a open source iOS library provide infinity scroll show a group of views in view.

##Demo
Build and run the `HMCycleViewDemo` project in Xcode to see `HMCycleView` in action.

##Setup
To enable fantasitic feature in your project with the following simple steps:

1. Download the project from GitHub.
2. Drop `HMCycleView` files into your project.
3. Add `#include "HMCycleView.h"` to the top of classes that will use it.

##Usage
#####Code example
``` objective-c

    // 1. create cycleView
    // 1. 创建cycleView
    HMCycleView *cycleViewCode = [[HMCycleView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 200)];
    cycleViewCode.backgroundColor = [UIColor whiteColor];

    // 2. put a group of views in this array
    // 2. 把所有需要轮播的view放在数组中
    cycleViewCode.itemViews = itemViews;

    // *set scroll time interval(Optional,The default is two seconds)
    // *设置轮播下一张的时间(可选，默认两秒)
    cycleViewCode.duration = 3;

    // *set delegate(Optional，Use for click event)
    // *设置代理(可选，用于监听点击事件)
    cycleViewCode.cycleViewDelegate = self;

    // 4.add this cycleView 
    // 4.添加到控制器view上
    [self.view addSubview:cycleViewCode];
    
```

##TODO
~~Each item click.~~

Each item description.

Page control.

##Author
**Yoson Hao**

Weibo:[@郝悦兴][1]

Github:[Hao Y.Xing][2]

##Thanks
**刀哥**

Github:[刘凡][3]

Blog:[Joy iOS][4]

##License
HMCycleView is released under the MIT license. See LICENSE for details.

[1]: http://weibo.com/haoyuexing
[2]: https://github.com/haoyuexing
[3]: https://github.com/liufan321
[4]: http://www.joyios.com/
