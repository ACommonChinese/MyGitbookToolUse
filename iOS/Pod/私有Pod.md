# 私有Pod

[官网Private Pods](http://guides.cocoapods.org/making/private-cocoapods.html)

总体流程：creating a private repository, letting CocoaPods know where to find it and adding the podspecs to the repository.

安装Cocoapods会到官方的索引库，生成本地索引库。使用Pod install时，默认情况下，会去更新本地索引库，当然了可以在后面添加--no-repo-update忽略更新。
这个本地索引库地址默认为: `~/.cocoapods/repos/`

这个索引库其实就是存储了一个个库的podspec描述文件。使用pod repo查看本地索引库：

```ruby
$ pod repo
master
- Type: git (master)
- URL:  https://github.com/CocoaPods/Specs.git # 公共索引库的地址
- Path: /Users/liuweizhen/.cocoapods/repos/master
```

上面的URL地址就是公共索引库的地址，里面存放着很多库的podspec索引文件。为了使我们私有的库也支持cocoapods就需要创建私有的索引库。

比如我在[码云](https://gitee.com/)上新建一个私有仓库`MyPrivateRepo`, 接下来将私有库添加到本地：

```ruby
pod repo add MyPrivateRepo https://gitee.com/aCommonChinese/MyPrivteRepo.git
```

再用pod repo查看本地pod索引库:

```
$ pod repo
master
- Type: git (master)
- URL:  https://github.com/CocoaPods/Specs.git
- Path: /Users/banma-623/.cocoapods/repos/master

MyPrivateRepo
- Type: git (master)
- URL:  https://gitee.com/aCommonChinese/MyPrivteRepo.git
- Path: /Users/liuweizhen/.cocoapods/repos/MyPrivateRepo
```

至此，本地私有索引库创建完成。

现在的本地私有索引库是空的，我们需要创建podspec文件并上传到私有库，示例：

```ruby
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
```

**把podspec文件上传到私有库**






