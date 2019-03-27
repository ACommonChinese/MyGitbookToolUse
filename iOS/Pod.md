# Pod

##### _一些概念_

ruby是一门脚本语言  
gem是管理ruby库和程序的标准工具包 - RubyGems is a package management framework for Ruby.  
CocoaPods是一个负责管理iOS项目中第三方库的工具  
CocoaPods是基于ruby ecosystem（生态）的，因此首先需要在机器上安装ruby，然后安装gem，使用gem安装或卸载cocaPods  
spec: sepcification: 规格；说明书；详述



##### CocoaPod的安装

更换gem source为rubychina:
gem sources —remove https://rubygems.org/ # 移除掉原有的源
gem sources -a gem sources --add https://gems.ruby-china.com/ #(参考：https://gems.ruby-china.com/)
gem sources -l # 验证是否成功
源: ruby china官网地址：https://gems.ruby-china.com/

upgrade to the latest RubyGems:
gem update —system
或： sudo gem update —system

OS X 10.11 以前安装命令为：
sudo gem install cocoapods # 安装cocoapods

Mac系统为OS X EL Capitan安装命令为：
sudo gem install -n /usr/local/bin cocoapods  # 安装最新版本
sudo gem install -n /usr/local/bin cocoapods -v 1.0.0 # 安装指定版本
sudo gem install -n /usr/local/bin cocoapods --pre # 安装最新的release beta版本

卸载CocoaPods:
sudo gem uninstall cocoapods

查看pod版本：
pod —version


##### 参考链接：

* 参考链接： [https://blog.csdn.net/jiankeufo/article/details/79362660](https://blog.csdn.net/jiankeufo/article/details/79362660)
* 官方文档：[http://guides.cocoapods.org/making/specs-and-specs-repo.html](http://guides.cocoapods.org/making/specs-and-specs-repo.html)
* 官方引导页：[https://guides.cocoapods.org/](https://guides.cocoapods.org/)
* Github地址：[https://github.com/CocoaPods](https://github.com/CocoaPods)
  .spec & .spec.json \[[https://github.com/CocoaPods/guides.cocoapods.org/issues/48](https://github.com/CocoaPods/guides.cocoapods.org/issues/48)
  [https://my.oschina.net/FEEDFACF/blog/1611959\]\(https://github.com/CocoaPods/guides.cocoapods.org/issues/48](https://my.oschina.net/FEEDFACF/blog/1611959]%28https://github.com/CocoaPods/guides.cocoapods.org/issues/48)
  [https://my.oschina.net/FEEDFACF/blog/1611959](https://my.oschina.net/FEEDFACF/blog/1611959)\)



