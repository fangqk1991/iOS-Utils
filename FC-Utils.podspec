#
# Be sure to run `pod lib lint FC-Utils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FC-Utils'
  s.version          = '0.1.0'
  s.summary          = 'A short description of FC-Utils.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/fangqk1991/iOS-Utils'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fangqk1991' => 'me@fangqk.com' }
  s.source           = { :git => 'https://github.com/fangqk1991/iOS-Utils.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|

    core.dependency 'JPush', '~> 3.0.9'

    core.source_files = 'FC-Utils/Core/*.{h,m}'
    core.public_header_files = 'FC-Utils/Core/*.h'

  end
  
  # s.resource_bundles = {
  #   'FC-Utils' => ['FC-Utils/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
end
