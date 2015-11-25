Pod::Spec.new do |s|
  s.name             = "DVACategories"
  s.version          = "1.7.0"
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

                        Added 1.2.1:

                        * CAGradientLayer:
                        ** CAGradientLayer+DVAGradient: Creates a gradient layer for your views. Added animation possibilities.
                        * CAShapeLayer:
                        ** CAShapeLayer+DVADashedBorder: Creates a layer to set a dashed border on a view.
                        ** CAShapeLayer+DVARound: Creates a layer to set a completely round side on a view.

                        Added 1.3.0:
                        * UITCollectionViewCell:
                        ** UICollectionViewCell+DVAReusableCollectionCell: Reuses and registers cells at collectionViews

                        Added 1.4.0:
                        * NSString:
                        ** NSString+DVASecure: MD5 hashing.
                        ** NSString+DVAValidator: Some validation methods.

                        Added 1.5.0:
                        * NSString:
                            ** NSString+DVAAttributedString: Attributed String converter.
                            ** NSString+DVALocalized: Localized string convenience method.
                        * NSAttributedString:
                            ** NSAttributedString+DVAAttributedString: Add attributes to an attributed string.
                            ** NSAttributedString+DVAImageAttachment: Attributted Strings with image attachments.
                        * NSArray:
                            ** NSArray+FP: Functional programming helpers.
                        * NSDictionary:
                            ** NSDictionary+FP: Functional programming helpers.
                        * NSData:
                            ** NSData+DVASecure: MD5 hashing.
                        * UIImage:
                            ** UIImage+DVASecure: MD5 hashing.
                        * UILabel:
                            ** UILabel+DVABadgeLabel: Setup a label over a view like a badge.
                        * UIView:
                            ** UIView+DVABadgeLabel: Setup a view over a view like a badge.
                        Added 1.6.0:
                        * NSString: Badge view now can be a string
                        Added 1.7.0:
                        * NSString: Strings from bundle

# --------
# ADD NEW CATEGORIES HERE
# --------

                       DESC
  s.homepage         = "https://www.develapps.es"
  s.license          = 'MIT'
  s.author           = { "Pablo Romeu" => "pablo.romeu@develapps.com" ,
                         "Pablo Salva" => "pablo.salva@develapps.com" }
  s.source           = {    :git => "https://bitbucket.com/DVALibs/DVACategories.git",
                            :tag => s.version.to_s,
                            :submodules => true }
  s.social_media_url = 'https://twitter.com/pabloromeu'

  s.platform     = :ios, '7.1'
  s.ios.deployment_target = '7.1'
  s.requires_arc = true
  s.frameworks            = "UIKit" , "Foundation"

#  s.source_files = 'Pod/Classes/Core/**/*.{h,m,c}'

  s.subspec 'Core' do |cs|
    cs.source_files = 'Pod/Classes/Core/**/*.{h,m,c}'
    
    # ANALITICS IS BROKEN. Cannot use podspec https://github.com/CocoaPods/CocoaPods/issues/3106

#     cs.dependency 'DVACategories/Analytics'
    cs.dependency 'DVACategories/UIColor'
    cs.dependency 'DVACategories/NSAttributedString'
    cs.dependency 'DVACategories/NSString'
    cs.dependency 'DVACategories/CAGradientLayer'
    cs.dependency 'DVACategories/CAShapeLayer'
    cs.dependency 'DVACategories/UICollectionViewCell'
    cs.dependency 'DVACategories/NSArray'
    cs.dependency 'DVACategories/NSDictionary'
    cs.dependency 'DVACategories/NSData'
    cs.dependency 'DVACategories/UIImage'
    cs.dependency 'DVACategories/UILabel'
    cs.dependency 'DVACategories/UIView'

#    cs.dependency 'DVACategories/DVAParseNotifications'
#    cs.dependency 'DVACategories/DVAParseRemoteNotificationsDefaultHandler'
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
    sp.dependency 'DVACategories/NSAttributedString'
    sp.source_files = 'Pod/Classes/NSString/**/*.{h,m}'
  end
  s.subspec 'UITableView' do |sp|
    sp.source_files = 'Pod/Classes/UITableView/**/*.{h,m}'
  end
    s.subspec 'CAGradientLayer' do |sp|
        sp.frameworks   = "QuartzCore"
        sp.source_files = 'Pod/Classes/CAGradientLayer/**/*.{h,m}'
    end
    s.subspec 'CAShapeLayer' do |sp|
        sp.frameworks   = "QuartzCore"
        sp.source_files = 'Pod/Classes/CAShapeLayer/**/*.{h,m}'
    end
  s.subspec 'UICollectionViewCell' do |sp|
    sp.source_files = 'Pod/Classes/UICollectionViewCell/**/*.{h,m}'
  end
  s.subspec 'NSArray' do |sp|
    sp.source_files = 'Pod/Classes/NSArray/**/*.{h,m}'
  end
  s.subspec 'NSDictionary' do |sp|
    sp.source_files = 'Pod/Classes/NSDictionary/**/*.{h,m}'
  end
  s.subspec 'NSData' do |sp|
    sp.source_files = 'Pod/Classes/NSData/**/*.{h,m}'
  end
  s.subspec 'UIImage' do |sp|
    sp.dependency 'DVACategories/NSData'
    sp.source_files = 'Pod/Classes/UIImage/**/*.{h,m}'
  end
  s.subspec 'UILabel' do |sp|
    sp.dependency 'DVACategories/UIView'
    sp.source_files = 'Pod/Classes/UILabel/**/*.{h,m}'
  end
  s.subspec 'UIView' do |sp|
    sp.source_files = 'Pod/Classes/UIView/**/*.{h,m}'
  end

#   s.subspec 'DVAParseNotifications' do |sp|
#     sp.dependency 'Parse'
#     sp.source_files = 'Pod/Classes/ParsePushNotifications/AppDelegate+DVAParseNotifications/**/*.{h,m}'
#   end
#   s.subspec 'DVAParseRemoteNotificationsDefaultHandler' do |sp|
#     sp.dependency 'Parse'
#     sp.dependency 'DVACategories/DVAParseNotifications'
#     sp.source_files = 'Pod/Classes/ParsePushNotifications/AppDelegate+DVAParseRemoteNotificationsDefaultHandler/**/*.{h,m}'
#   end
# # --------
# ADD NEW SUBSPECS HERE
# --------

  # s.resource_bundles = {
  #    'DVACategories' => ['Pod/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
