#
# Be sure to run `pod lib lint Yuehan.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Yuehan'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Yuehan.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/869313996@qq.com/Yuehan'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '869313996@qq.com' => 'gelei@anve.com' }
  s.source           = { :git => 'https://github.com/869313996@qq.com/Yuehan.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Yuehan/Classes/**/*'
  
  script1 = <<-CMD
    #Pods目录
    podsPath=$(pwd)
    echo $podsPath >> /Users/gelei/Downloads/tst.txt
  CMD
  
  script2 = <<-CMD
    echo "Hello world" >> /Users/gelei/Downloads/tst.txt
  CMD
  #shell_path指定脚本运行环境,execution_position指定遍以前还是编译后执行
#  s.script_phase = { :name => 'pod compile before', :script => script1, :shell_path =>'/bin/sh', :execution_position => :before_compile}
  
#  #script_phase2
  s.script_phase = [
  { :name => 'pod compile before1', :script => script1, :shell_path =>'/bin/sh', :execution_position => :before_compile},
  { :name => 'pod compile before2', :script => script2, :shell_path =>'/bin/sh', :execution_position => :before_compile}
  ]

  # s.resource_bundles = {
  #   'Yuehan' => ['Yuehan/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
