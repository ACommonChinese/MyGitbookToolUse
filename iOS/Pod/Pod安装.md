# Pod安装

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

