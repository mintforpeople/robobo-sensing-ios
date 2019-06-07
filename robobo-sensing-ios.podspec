#
# Be sure to run `pod lib lint robobo-sensing-ios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'robobo-sensing-ios'
  s.version          = '0.1.2'
  s.summary          = 'Robobo sensing modules'
  s.swift_version    = '4.2'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Robobo sensing library, includes IMU and Touch modules
                       DESC

  s.homepage         = 'https://github.com/mintforpeople/robobo-sensing-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'LGPLv3', :file => 'LICENSE' }
  s.author           = { 'Luis Felipe Llamas Luaces' => 'luis.llamas@mintforpeople.com' }
  s.source           = { :git => 'https://github.com/mintforpeople/robobo-sensing-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'robobo-sensing-ios/Classes/**/*'
  
  # s.resource_bundles = {
  #   'robobo-sensing-ios' => ['robobo-sensing-ios/Assets/*.png']
  # }

  s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'robobo-framework-ios-pod', '~>0.1.0'
   s.dependency 'robobo-remote-control-ios', '~>0.1.2'

end
