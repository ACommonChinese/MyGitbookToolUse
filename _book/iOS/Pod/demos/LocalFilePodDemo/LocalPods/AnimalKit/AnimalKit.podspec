#
#  Be sure to run `pod spec lint AnimalKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "AnimalKit" # 注意，这个name就是被用来在Podfile中引用的名字：pod 'AnimalKit', :path => '/Users/.../AnimalKit'
  spec.platform     = :ios, '9.0'
  spec.version      = "1.0.0"
  spec.homepage 	= "/Users/banma-623/Desktop/ForDelete/LocalFilePodDemo/LocalPods/AnimalKit"
  spec.summary      = "nimalKit summary: Animal behaviors encapsulate"
  spec.license      = "MIT"
  spec.author       = { "刘威振" => "liuxing8807@126.com" }
  spec.source       = { :git => "file:/.", :tag => "#{spec.version}" }
  spec.source_files  = "*.{h,m}"
  spec.exclude_files = "AnimalKit.podspec"
end
