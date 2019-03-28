# Pod

##### 一些概念

ruby是一门脚本语言  
gem是管理ruby库和程序的标准工具包 - RubyGems is a package management framework for Ruby.  
CocoaPods是一个负责管理iOS项目中第三方库的工具  
CocoaPods是基于ruby ecosystem（生态）的，因此首先需要在机器上安装ruby，然后安装gem，使用gem安装或卸载cocaPods  
spec: sepcification: 规格；说明书；详述

##### CocoaPod的安装

更换gem source为rubychina:  
gem sources —remove [https://rubygems.org/](https://rubygems.org/) \# 移除掉原有的源  
gem sources -a gem sources --add [https://gems.ruby-china.com/](https://gems.ruby-china.com/) \#\(参考：[https://gems.ruby-china.com/](https://gems.ruby-china.com/)\)  
gem sources -l \# 验证是否成功  
源: ruby china官网地址：[https://gems.ruby-china.com/](https://gems.ruby-china.com/)

upgrade to the latest RubyGems:  
gem update —system  
或： sudo gem update —system

OS X 10.11 以前安装命令为：  
sudo gem install cocoapods \# 安装cocoapods

Mac系统为OS X EL Capitan安装命令为：  
sudo gem install -n /usr/local/bin cocoapods  \# 安装最新版本  
sudo gem install -n /usr/local/bin cocoapods -v 1.0.0 \# 安装指定版本  
sudo gem install -n /usr/local/bin cocoapods --pre \# 安装最新的release beta版本

卸载CocoaPods:  
sudo gem uninstall cocoapods

查看pod版本：  
pod —version

cocoapods本地路径： .cocoapods/repos/master

##### 创建Spec

You can create one by hand, or run pod spec create to generate a stub. Podspecs are ruby files.  
`pod spec create Hello`会生成Hello.podspec文件.

From [官网资料：](http://guides.cocoapods.org/making/specs-and-specs-repo.html)

The [Specs Repo](https://github.com/CocoaPods/Specs) is the repository on GitHub that contains the list of all available pods. Every library has an individual folder, which contains sub folders of the available versions of that pod.

Here is an example spec:

```Ruby
# A Simple specification.
Pod::Spec.new do |spec|
  spec.name         = 'libPusher'
  spec.version      = '1.3'
  spec.license      = 'MIT'
  spec.summary      = 'An Objective-C client for the Pusher.com service'
  spec.homepage     = 'https://github.com/lukeredpath/libPusher'
  spec.author       = 'Luke Redpath'
  spec.source       = { :git => 'git://github.com/lukeredpath/libPusher.git', :tag => 'v1.3' }
  spec.source_files = 'Library/*'
  spec.requires_arc = true
  spec.dependency 'SocketRocket'
end
```

A specification with subspecs

```Objective-C
Pod::Spec.new do |spec|
  spec.name          = 'ShareKit'
  spec.source_files  = 'Classes/ShareKit/{Configuration,Core,Customize UI,UI}/**/*.{h,m,c}'
  # ...

  spec.subspec 'Evernote' do |evernote|
    evernote.source_files = 'Classes/ShareKit/Sharers/Services/Evernote/**/*.{h,m}'
  end

  spec.subspec 'Facebook' do |facebook|
    facebook.source_files   = 'Classes/ShareKit/Sharers/Services/Facebook/**/*.{h,m}'
    facebook.compiler_flags = '-Wno-incomplete-implementation -Wno-missing-prototypes'
    facebook.dependency 'Facebook-iOS-SDK'
  end
  # ...
end
```

Subspecs are a way of chopping up the functionality of a Podspec, allowing people to install a subset of your library.

With the above example a Podfile using pod 'ShareKit' results in the inclusion of the whole library, while pod 'ShareKit/Facebook' can be used if you are interested only in the Facebook specific parts.

A specification with subspecs within submodules

If you have some submodules in the repository you need to set the `:submodules` key of the `s.source` hash to true. Then you'll be able to specify subspec like above.

```Ruby
Pod::Spec.new do |spec|
  spec.name          = 'SDLoginKit'
  spec.source        =  { 
      :git => 'https://github.com/dulaccc/SDLoginKit.git',
      :tag => '1.0.2', 
      :submodules => true 
  }
  # ...

  spec.subspec 'SDKit' do |sdkit|
    sdkit.source_files = 'SDKit/**/*.{h,m}'
    sdkit.resources    = 'SDKit/**/Assets/*.png'
  end
  # ...
end
```



##### Private Pods

[官网Private Pods](http://guides.cocoapods.org/making/private-cocoapods.html)

##### 参考链接：

* 参考链接： [https://blog.csdn.net/jiankeufo/article/details/79362660](https://blog.csdn.net/jiankeufo/article/details/79362660)
* 官方文档：[http://guides.cocoapods.org/making/specs-and-specs-repo.html](http://guides.cocoapods.org/making/specs-and-specs-repo.html)
* 官方引导页：[https://guides.cocoapods.org/](https://guides.cocoapods.org/)
* Github地址：[https://github.com/CocoaPods](https://github.com/CocoaPods)
  .spec & .spec.json \[[https://github.com/CocoaPods/guides.cocoapods.org/issues/48](https://github.com/CocoaPods/guides.cocoapods.org/issues/48)
  [https://my.oschina.net/FEEDFACF/blog/1611959\]\(https://github.com/CocoaPods/guides.cocoapods.org/issues/48](https://my.oschina.net/FEEDFACF/blog/1611959]%28https://github.com/CocoaPods/guides.cocoapods.org/issues/48)
  [https://my.oschina.net/FEEDFACF/blog/1611959](https://my.oschina.net/FEEDFACF/blog/1611959)\)



