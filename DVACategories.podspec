#
# Be sure to run `pod lib lint DVACategories.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DVACategories"
  s.version          = "1.0.0"
  s.summary          = "This pod hosts DVACategories commonly used by DVA iOS developers."
  s.description      = <<-DESC
                       This is a pod containing categories commonly used on iOS development.

                        Currently it holds:

                        * Analytics:
                        ** GAI+DVALib: A category helper for the Google Analytics Platform
                        * UIColor:
                        ** UIColor+DVALib: A class that implements helper for UIColor.
                        * NSAttributedString:
                        ** NSAttributedString+DVASize: A class to compute size for attributtedString
                        * UITableView:
                        ** UITableView+DVACellHeight: Calculates heights for cells at tableViews
# --------
# ADD NEW CATEGORIES HERE
# --------

                       DESC
  s.homepage         = "https://www.develapps.es"
  s.license          = 'MIT'
  s.author           = { "Pablo Romeu" => "pablo.romeu@develapps.es" }
  s.source           = {    :git => "https://bitbucket.com/DVALibs/DVACategories.git",
                            :tag => s.version.to_s,
                            :submodules => true }
  s.social_media_url = 'https://twitter.com/pabloromeu'

  s.platform     = :ios, '7.1'
  s.ios.deployment_target = '7.1'
  s.requires_arc = true
  s.frameworks            = "UIKit" , "Foundation"

#s.source_files = 'Pod/Classes/Core/**/*.{h,m,c}'

  s.subspec 'DVACategories' do |cs|
    cs.source_files = 'Pod/Classes/Core/**/*.{h,m,c}'
    
    # ANALITICS IS BROKEN. Cannot use podspec https://github.com/CocoaPods/CocoaPods/issues/3106
#     cs.dependency 'DVACategories/Analytics'
    cs.dependency 'DVACategories/UIColor'
    cs.dependency 'DVACategories/NSAttributedString'
    cs.dependency 'DVACategories/NSString'
    cs.dependency 'DVACategories/UITableView'
# --------
# ADD NEW POD NAMES HERE
# --------
  end

# ANALITICS IS BROKEN. Cannot use podspec
#   s.subspec 'Analytics' do |sp|
#         sp.platform = :ios, '7.1'
#         sp.dependency 'GoogleAnalytics-iOS-SDK'
#         sp.source_files = 'Pod/Classes/Analytics/**/*.{h,m}'
#   end
  s.subspec 'UIColor' do |sp|
    sp.source_files = 'Pod/Classes/UIColor/**/*.{h,m}'
  end
  s.subspec 'NSAttributedString' do |sp|
    sp.source_files = 'Pod/Classes/NSAttributtedString/**/*.{h,m}'
  end
  s.subspec 'NSString' do |sp|
    sp.source_files = 'Pod/Classes/NSString/**/*.{h,m}'
  end
  s.subspec 'UITableView' do |sp|
    sp.source_files = 'Pod/Classes/UITableView/**/*.{h,m}'
  end
# --------
# ADD NEW SUBSPECS HERE
# --------

  # s.resource_bundles = {
  #    'DVACategories' => ['Pod/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
