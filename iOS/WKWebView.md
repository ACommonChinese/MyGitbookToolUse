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
// 带配置信息的初始化方法，configuration表示配置信息对象
- (instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration
// 加载请求
- (nullable WKNavigation *)loadRequest:(NSURLRequest *)request;
// 加载HTML
- (nullable WKNavigation *)loadHTMLString:(NSString *)string baseURL:(nullable NSURL *)baseURL;
// 返回上一级
- (nullable WKNavigation *)goBack;
// 前进下一级, 需要曾经打开过, 才能前进
- (nullable WKNavigation *)goForward;
// 刷新页面
- (nullable WKNavigation *)reload;
// 根据缓存有效期来刷新页面
- (nullable WKNavigation *)reloadFromOrigin;
// 停止加载页面
- (void)stopLoading;
// 执行JavaScript代码
- (void)evaluateJavaScript:(NSString *)javaScriptString completionHandler:(void (^ _Nullable)(_Nullable id, NSError * _Nullable error))completionHandler;
```

### WKWebViewConfiguration

```Objective-C
// 内容交互控制器，自己注入JS代码及JS调用原生方法注册，在delloc时需要移除注入
@property (nonatomic, strong) WKUserContentController *userContentController;
// 用户选择网页内容的粒度，默认值WKSelectionGranularityDynamic
@property (nonatomic) WKSelectionGranularity selectionGranularity;
// 网页加载时的偏好设置，比如是否通过js自动打开新的窗口  
@property (nonatomic, strong) WKPreferences *preferences;
// 网站数据储存对象，这个属性根据自己需求选择不设置（使用默认）或自己设置，使用这个对象可以设置不存储任何数据和移除/获取缓存数据, [WKWebsiteDataStore defaultDataStore], [WKWebsiteDataStore nonPersistentDataStore]; [WKWebsiteDataStore defaultDataStore].httpCookieStore
@property (nonatomic, strong) WKWebsiteDataStore *websiteDataStore API_AVAILABLE(macosx(10.11), ios(9.0));
// 是否允许播放媒体文件
@property (nonatomic) BOOL allowsAirPlayForMediaPlayback
// 需要用户来操作才能播放的多媒体类型
@property (nonatomic) WKAudiovisualMediaTypes mediaTypesRequiringUserActionForPlayback
// 是使用h5的视频播放器在线播放, 还是使用原生播放器全屏播放
@property (nonatomic) BOOL allowsInlineMediaPlayback;
// 把硬件的一些信息告诉浏览器, 如：self.yourSite.customUserAgent=@"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.3; Trident/7.0; .NET4.0E; .NET4.0C)";
@property (nullable, nonatomic, copy) NSString *applicationNameForUserAgent API_AVAILABLE(macosx(10.11), ios(9.0));
// 是否在加载完之后再渲染网页
@property (nonatomic) BOOL suppressesIncrementalRendering;
// 布尔值, 确定wkwebView对象是否总是允许网页缩放
@property (nonatomic) BOOL ignoresViewportScaleLimits API_AVAILABLE(ios(10.0));
// 网页内容探测, 默认：WKDataDetectorTypeNone; WKDataDetectorTypePhoneNumber， WKDataDetectorTypeLink， ...
@property (nonatomic) WKDataDetectorTypes dataDetectorTypes API_AVAILABLE(ios(10.0));
```

### WKUserContentController

WKUserContentController 是JavaScript与原生进行交互的桥梁, 主要使用的方法有:

```Objective-C
// 注入JavaScript与原生交互协议
// JS 端可通过 window.webkit.messageHandlers.<name>.postMessage(<messageBody>) 发送消息
- (void)addScriptMessageHandler:(id <WKScriptMessageHandler>)scriptMessageHandler name:(NSString *)name;
// 移除注入的协议, 在dealloc方法中调用
- (void)removeScriptMessageHandlerForName:(NSString *)name;
// 通过WKUserScript注入需要执行的JavaScript代码
- (void)addUserScript:(WKUserScript *)userScript;
// 移除所有注入的JavaScript代码
- (void)removeAllUserScripts;
```

使用WKUserContentController注入的交互协议, 需要遵循WKScriptMessageHandler协议, 在其协议方法中获取JavaScript端传递的事件和参数:

```Objective-C
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message;
```

WKScriptMessage包含了传递的协议名称及参数, 主要从下面的属性中获取:

```Objective-C
// 协议名称, 即上面的add方法传递的name
@property (nonatomic, readonly, copy) NSString *name;
// 传递的参数
@property (nonatomic, readonly, copy) id body;
```

### WKUserScript

WKUserScript用于往加载的页面中添加额外需要执行的JavaScript代码, 主要是一个初始化方法:

```Objective-C
/*
source: 需要执行的JavaScript代码
injectionTime: 加入的位置, 是一个枚举
typedef NS_ENUM(NSInteger, WKUserScriptInjectionTime) {
    WKUserScriptInjectionTimeAtDocumentStart,
    WKUserScriptInjectionTimeAtDocumentEnd
} API_AVAILABLE(macosx(10.10), ios(8.0));

forMainFrameOnly: 是加入所有框架, 还是只加入主框架
*/
- (instancetype)initWithSource:(NSString *)source injectionTime:(WKUserScriptInjectionTime)injectionTime forMainFrameOnly:(BOOL)forMainFrameOnly;
```

### WKUIDelegate

The WKUIDelegate class provides methods for presenting native user interface elements on behalf of a webpage.
WKUIDelegate这个类提供了一些方法，作用是为了在webpage上可以显示一些native的交互元素。
比如使用系统的弹框来替换JS中的一些弹框。

```Objective-C
/**
 webView中弹出警告框时调用, 只能有一个按钮

 @param webView webView
 @param message 提示信息
 @param frame 可用于区分哪个窗口调用的
 @param completionHandler 警告框消失的时候调用, 回调给JS
 */
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"我知道了" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

/** 对应js的confirm方法
 webView中弹出选择框时调用, 两个按钮

 @param webView webView description
 @param message 提示信息
 @param frame 可用于区分哪个窗口调用的
 @param completionHandler 确认框消失的时候调用, 回调给JS, 参数为选择结果: YES or NO
 */
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择" message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"同意" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"不同意" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

/** 对应js的prompt方法
 webView中弹出输入框时调用, 两个按钮 和 一个输入框

 @param webView webView description
 @param prompt 提示信息
 @param defaultText 默认提示文本
 @param frame 可用于区分哪个窗口调用的
 @param completionHandler 输入框消失的时候调用, 回调给JS, 参数为输入的内容
 */
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable result))completionHandler {
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入" message:prompt preferredStyle:(UIAlertControllerStyleAlert)];

    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入";
    }];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
        UITextField *tf = [alert.textFields firstObject];
        
                completionHandler(tf.text);
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
                completionHandler(defaultText);
    }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}
```

### WKNavigationDelegate




注：对于加载非https的url, 须在Info.plist中添加App Transport Security Settings的Allow Arbitrary Loads为YES

### 进度条

参考链接

[https://www.cnblogs.com/mafeng/p/7266655.html](https://www.cnblogs.com/mafeng/p/7266655.html)  
[https://www.jianshu.com/p/833448c30d70](https://www.jianshu.com/p/833448c30d70)

