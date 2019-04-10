# Frameworks的创建和使用

库是程序代码的集合, 是封装和共享程序代码的一种方式，根据源代码的公开情况,库可以分为2种类型：
- 开源库
  - 公开源代码,能看到具体实现
  - 如SDWebImage, AFNetworking
- 闭源库
  - 不公开源代码,是经过编译后的二进制文件,看不到具体实现
  - 主要分为: 静态库, 动态库

### 动态库的创建和使用

新建一个Single View App的iOS工程：TestWeakLink, 然后在工程主目录下建一module文件夹，引入这个module文件夹到工程。
再建一个叫MyFramework的库(File -> New -> Project -> Cocoa Touch Framework)，放入module目录中，右键module -> Add files to 'TestWeakLink' -> 把MyFramework/MyFramwork.xcodeproj引入进去
![](images/1.png)

我们新建一个Person类，然后测试：

```Objective-C
@interface Person : NSObject

- (void)eat:(NSString *)food;

@end

@implementation Person

- (void)eat:(NSString *)food {
    NSLog(@"Person eat: %@", food);
}

@end
```

要使用Framework，需要做以下配置：

1. 把Person.h头文件引入MyFramework.h
```Objective-C
#if __has_include(<MyFramwork/MyFramwork.h>)
#import <MyFramwork/Person.h>
#else
#import "Person.h"
#endif
```

2. 把Person.h这个头文件放入Public中
![](images/2.png)

3. 主项目中 -> TARGETS -> Build Phases -> Link Binary With Libraries -> click "+" 加入MyFramework.framework。同理在Target Dependencies中也加入，另外在General下面的Embedded Binaries中也加入

![](images/3.png)

4. 使用：

```Objective-c
#import <MyFramework/MyFramework.h>


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *p = Person.new;
    [p eat:@"Fruit"];
}


@end
```

我们这样建的Framework是动态库，可以进入到MyFramework目录，找到MyFramework, 使用file命令查看：
```bash
$ file MyFramework
MyFramework: Mach-O 64-bit dynamically linked shared library x86_64 # dynamically linked代表是动态链接, 也可以使用lipo -info MyFramework 查看架构信息
```

动态库里可以引入一些静态库，如果这些静态库不暴露在外面，则不会和外面项目中的库引起冲突。

### 静态库的.a的创建和使用
Cocoa Touch Framework, 即.framework有动态库和静态库之分，Cocoa Touch Static Library，即.a是静态库

![](images/4.png)



----------------------

参考链接：



