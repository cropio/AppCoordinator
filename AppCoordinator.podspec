#
# Be sure to run `pod lib lint Coordinator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AppCoordinator'
  s.version          = `git describe --abbrev=0 --tags`
  s.summary          = 'Library for realization MVVM-C pattern'
  s.description      = 'Library for realization MVVM + Coordinator pattern, using storyboards. Support universal app'

  s.homepage         = 'https://github.com/lumyk/AppCoordinator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Evgeny Kalashnikov' => 'lumyk@me.com' }
  s.source           = { :git => 'https://github.com/lumyk/AppCoordinator.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'Sources/**/*'
  s.swift_version = '5.0'
end
