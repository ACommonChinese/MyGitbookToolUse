# 提交自己的Pod

当我们自己写了一个库，可以针对这个库生成一个对应的.podspec文件并上传给CocoaPods官网。

在开始之前，我们先来看一下第三方的podspec，比如IQKeyboardManager, 在~/.cocoapods/repos/master/Specs/下存在spec文件: `IQKeyboardManager.podspec.json`  
```JSON
{
  "name": "IQKeyboardManager",
  "version": "6.2.0",
  "source": {
    "git": "https://github.com/hackiftekhar/IQKeyboardManager.git",
    "tag": "v6.2.0"
  },
  "summary": "Codeless drop-in universal library allows to prevent issues of keyboard sliding up and cover UITextField/UITextView.",
  "homepage": "https://github.com/hackiftekhar/IQKeyboardManager",
  "screenshots": "https://raw.githubusercontent.com/hackiftekhar/IQKeyboardManager/master/Screenshot/IQKeyboardManagerScreenshot.png",
  "license": "MIT",
  "authors": {
    "Iftekhar Qurashi": "hack.iftekhar@gmail.com"
  },
  "platforms": {
    "ios": "8.0"
  },
  "source_files": "IQKeyboardManager/**/*.{h,m}",
  "public_header_files": [
    "IQKeyboardManager/IQKeyboardManager.h",
    "IQKeyboardManager/IQKeyboardReturnKeyHandler.h",
    "IQKeyboardManager/Categories/IQUIScrollView+Additions.h",
    "IQKeyboardManager/Categories/IQUITextFieldView+Additions.h",
    "IQKeyboardManager/Categories/IQUIView+Hierarchy.h",
    "IQKeyboardManager/Categories/IQUIViewController+Additions.h",
    "IQKeyboardManager/Constants/IQKeyboardManagerConstants.h",
    "IQKeyboardManager/IQTextView/IQTextView.h",
    "IQKeyboardManager/IQToolbar/IQBarButtonItem.h",
    "IQKeyboardManager/IQToolbar/IQPreviousNextView.h",
    "IQKeyboardManager/IQToolbar/IQTitleBarButtonItem.h",
    "IQKeyboardManager/IQToolbar/IQToolbar.h",
    "IQKeyboardManager/IQToolbar/IQUIView+IQKeyboardToolbar.h"
  ],
  "resources": "IQKeyboardManager/Resources/IQKeyboardManager.bundle",
  "frameworks": [
    "UIKit",
    "Foundation",
    "CoreGraphics",
    "QuartzCore"
  ],
  "requires_arc": true
}
```
这些第三方库的描述清单文件均为xxx.podspec.json，内容是JSON, 并不是.podspec, 关于这个问题可以参见：
[https://github.com/CocoaPods/CocoaPods/issues/1485](https://github.com/CocoaPods/CocoaPods/issues/1485)
[https://github.com/CocoaPods/CocoaPods/issues/2313](https://github.com/CocoaPods/CocoaPods/issues/2313)
Just to clarify, you do not actually need to use JSON specs anywhere other than the master specs repository, and trunk deals with this conversion. You can use the Ruby spec with CocoaPods.
You can already convert specs from Ruby DSL to JSON:
```Ruby
$ pod ipc spec --help
Usage:

    $ pod ipc spec PATH

      Converts a podspec to JSON and prints it to STDOUT.
$ pod ipc spec QueryKit.podspec
```

即，可以通过命令pod ipc spec xxx.podspec转换成.json，比如：
```Ruby
$ pod ipc spec --help
Usage:

    $ pod ipc spec PATH

      Converts a podspec to JSON and prints it to STDOUT.

Options:

    --silent    Show nothing
    --verbose   Show more debugging information
    --no-ansi   Show output without ANSI codes
    --help      Show help banner of specified command
$ pod ipc spec ZZQRManager.podspec
{
  "name": "ZZQRManager",
  "version": "1.3",
  "summary": "An easy way to use qr manage",
  "homepage": "https://github.com/ACommonChinese/ZZQRManager/",
  "license": "MIT",
  "authors": {
    "ACommonChinese": "liuxing8807@126.com"
  },
  "platforms": {
    "ios": "11.0"
  },
  "source": {
    "git": "https://github.com/ACommonChinese/ZZQRManager.git",
    "tag": "1.3"
  },
  "source_files": "ZZQRManager/*.{h,m}",
  "resources": "ZZQRManager/ZZQRManager.bundle",
  "frameworks": "UIKit",
  "requires_arc": true
}
```

我们向CocoaPods官网提交的文件依然是.podspec, trunk会帮我们转成json的。

正式开始：

假设项目和库都写好：

在项目PodTest中添加.podspec文件（在根目录添加）
`pod spec create 'ZZQRManager'` # 创建ZZQRManager.podspec文件

以下是我的文件结构：

* ZZQRManager
  * Demo
  * images
  * LICENSE
  * README.md
  * ZZQRManager目录, 里面是.h .m ZZQRManager.bundle
  * ZZQRManager.podspec

Pod::Spec.new do |s|
    s.name         = 'ZZQRManager'
    s.version      = '1.3'
    s.summary      = 'An easy way to use qr manage'
    s.homepage     = 'https://github.com/ACommonChinese/ZZQRManager/'
    s.license      = 'MIT'
    s.authors      = {'ACommonChinese' => 'liuxing8807@126.com'}
    s.platform     = :ios, '11.0'
    s.source       = {:git => "https://github.com/ACommonChinese/ZZQRManager.git", :tag => s.version}
    s.source_files = 'ZZQRManager/*.{h,m}'
    s.resource     = 'ZZQRManager/ZZQRManager.bundle'
    s.frameworks   = "UIKit"
    s.requires_arc = true
end






