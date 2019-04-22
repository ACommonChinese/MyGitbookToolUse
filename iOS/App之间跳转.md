# App之间跳转

先来看打开其他APP的代码：

```Objective-C
NSURL *url = [NSURL URLWithString:@"SomeApp://xxx"];
if ([[UIApplication sharedApplication] canOpenURL:url]) {
    [[UIApplication sharedApplication] openURL:url];
}
```

代码`[[UIApplication sharedApplication] canOpenURL:url]`会查找`Info.plist`下`LSApplicationQueriesSchemes`选项中是否存在`SomeApp`，如果存在则表示`can open`
代码`[[UIApplication sharedApplication] openURL:url]`即打开url, 即打开schema为`SomeApp`的应用。即这个`SomeApp`需要在其Info.plist中的URL types中配置形如：
- URL types
  - item0
    - URL identifier: 此应用的identififier
    - URL Schemes
      - item0: SomeApp
