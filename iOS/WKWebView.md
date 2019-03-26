# WKWebView

WKWebView是iOS8 出来的浏览器控件, 用来取代UIWebView。使用时import：&lt;WebKit/WebKit.h&gt;

Core class:

* WKWebView
* WKWebViewConfiguration
* WKUserScript
* WKUserContentController
* WKWebsiteDataStore

2 delegate:

* WKNavigationDelegate
* WKUIDelegate

### WKWebView

```Objective-C
============================ 常用属性 ============================
// 导航代理
@property (nullable, nonatomic, weak) id <WKNavigationDelegate> navigationDelegate;
// UI代理
@property (nullable, nonatomic, weak) id <WKUIDelegate> UIDelegate;
// 页面标题, 一般使用KVO动态获取
@property (nullable, nonatomic, readonly, copy) NSString *title;
// 页面加载进度, 一般使用KVO动态获取
@property (nonatomic, readonly) double estimatedProgress;
// 可返回的页面列表, 已打开过的网页, 有点类似于navigationController的viewControllers属性
@property (nonatomic, readonly, strong) WKBackForwardList *backForwardList;
// 页面url
@property (nullable, nonatomic, readonly, copy) NSURL *URL;
// 页面是否在加载中
@property (nonatomic, readonly, getter=isLoading) BOOL loading;
// 是否可返回
@property (nonatomic, readonly) BOOL canGoBack;
// 是否可向前
@property (nonatomic, readonly) BOOL canGoForward;
// WKWebView继承自UIScrollView, 所以如果想设置scrollView的一些属性, 需要对此属性进行配置
@property (nonatomic, readonly, strong) UIScrollView *scrollView;
// 是否允许手势左滑返回上一级, 类似导航控制的左滑返回
@property (nonatomic) BOOL allowsBackForwardNavigationGestures;
// 自定义UserAgent, 会覆盖默认的值, iOS 9之后有效
@property (nullable, nonatomic, copy) NSString *customUserAgent

============================ 常用方法 ============================
```

### 进度条

参考链接

[https://www.cnblogs.com/mafeng/p/7266655.html](https://www.cnblogs.com/mafeng/p/7266655.html)

[https://www.jianshu.com/p/833448c30d70](https://www.jianshu.com/p/833448c30d70)

