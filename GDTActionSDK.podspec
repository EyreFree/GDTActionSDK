Pod::Spec.new do |s|
  s.name             = 'GDTActionSDK'
  s.version          = '1.0.3.2'
  s.summary          = 'GDTActionSDK CocoaPods 封装'

  s.description      = <<-DESC
广点通 DMP 行为数据上报 iOS 端 SDK。
                       DESC

  s.homepage         = 'https://github.com/EyreFree/GDTActionSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  # s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'EyreFree' => 'eyrefree@eyrefree.org' }
  s.source           = { :git => 'https://github.com/EyreFree/GDTActionSDK.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/EyreFree777'

  s.ios.deployment_target = '8.0'

  s.source_files = 'GDTActionSDK/Classes/**/*'
  s.vendored_frameworks = 'GDTActionSDK/Frameworks/GDTActionSDK.framework'
end
