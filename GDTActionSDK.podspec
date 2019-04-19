Pod::Spec.new do |s|
  s.name             = 'GDTActionSDK'
  s.version          = '1.0.3'
  s.summary          = 'A short description of GDTActionSDK.'

  s.description      = <<-DESC
Add long description of the pod here.
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
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
