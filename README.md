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

    // 1. create cycleView(set 'frame' or 'autoLayout').
    HMCycleView *cycleView = [[HMCycleView alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];

    NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"Home_Scroll_01.jpg" withExtension:nil];
    NSURL *url2 = [[NSBundle mainBundle] URLForResource:@"Home_Scroll_02.jpg" withExtension:nil];
    NSURL *url3 = [[NSBundle mainBundle] URLForResource:@"Home_Scroll_03.jpg" withExtension:nil];
    NSURL *url4 = [[NSBundle mainBundle] URLForResource:@"Home_Scroll_04.jpg" withExtension:nil];
    NSURL *url5 = [[NSBundle mainBundle] URLForResource:@"Home_Scroll_05.jpg" withExtension:nil];
    // 2. set array with image's URL.
    cycleView.imageURLs = @[ url1, url2, url3, url4, url5 ];

    // 3. add this cycleView.
    [self.view addSubview:cycleView];
    
```

##TODO
~~Each item click.~~

Each item description.

~~Page control.~~

Page control custom color.

Scroll duration.

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
