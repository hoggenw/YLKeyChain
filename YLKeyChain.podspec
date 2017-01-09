#
# Be sure to run `pod lib lint YLKeyChain.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YLKeyChain'
  s.version          = '0.0.1'
  s.summary          = '简单的KeyChain使用'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
开发中简单的KeyChain使用，包含删除、存储、读取；没有相关错误处理
                       DESC

  s.homepage         = 'https://github.com/hoggenw/YLKeyChain'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dev-wangliugen' => '253192463@qq.com' }
  s.source           = { :git => 'https://github.com/hoggenw/YLKeyChain.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YLKeyChain/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YLKeyChain' => ['YLKeyChain/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
