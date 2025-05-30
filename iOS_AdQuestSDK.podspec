Pod::Spec.new do |s|

  s.name             = 'iOS_AdQuestSDK'
  s.version          = '0.0.2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.summary          = '广告SDK'
  s.description      = '一个可以展示不同平台的广告SDK'

  s.homepage         = 'https://github.com/Wu-An-Jun/iOS_AdQuestSDK'
  s.author           = { 'Lzc' => '2489754250@qq.com' }
  s.source           = { :git => 'https://github.com/Wu-An-Jun/iOS_AdQuestSDK.git', :tag => s.version.to_s }

  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  s.platform     = :ios, "12.0"
  s.requires_arc = true
  s.static_framework = true

  s.resource_bundles = {
    'iOS_AdQuestSDK' => ['Assets/**/*.*']
  }

  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = 'Classes/Core/**/*.{h,m}'
    core.frameworks = 'UIKit', 'Foundation', 'AdSupport'
  end

  s.subspec 'AdSpot' do |adSpot|
    adSpot.dependency 'iOS_AdQuestSDK/Core'
    adSpot.source_files = 'Classes/AdSpot/**/*.{h,m}'
  end

  s.subspec 'MercuryAdapter' do |mer|
    mer.dependency 'iOS_AdQuestSDK/AdSpot'
    mer.dependency 'MercurySDK', '4.4.7'
    mer.source_files = 'Classes/Adapters/Mercury/**/*.{h,m}'
    mer.pod_target_xcconfig = {
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
    mer.user_target_xcconfig = {
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  end

  s.subspec 'CSJAdapter' do |csj|
    csj.dependency 'iOS_AdQuestSDK/AdSpot'
    csj.dependency 'Ads-CN-Beta/BUAdSDK', '6.8.0.1'
    csj.source_files = 'Classes/Adapters/CSJ/**/*.{h,m}'
  end

  s.subspec 'GDTAdapter' do |gdt|
    gdt.dependency 'iOS_AdQuestSDK/AdSpot'
    gdt.dependency 'GDTMobSDK', '4.15.30'
    gdt.source_files =  'Classes/Adapters/GDT/**/*.{h,m}'
  end

  s.subspec 'KSAdapter' do |ks|
    ks.dependency 'iOS_AdQuestSDK/AdSpot'
    ks.dependency 'KSAdSDK', '3.3.74'
    ks.source_files = 'Classes/Adapters/KS/**/*.{h,m}'
  end

  s.subspec 'BDAdapter' do |bd|
    bd.dependency 'iOS_AdQuestSDK/AdSpot'
    bd.dependency 'BaiduMobAdSDK', '5.373'
    bd.source_files =  'Classes/Adapters/BD/**/*.{h,m}'
  end

  s.subspec 'TanxAdapter' do |tanx|
    tanx.dependency   'iOS_AdQuestSDK/AdSpot'
    tanx.dependency 'TanxSDK', '3.7.2'
    tanx.source_files =  'Classes/Adapters/TANX/**/*.{h,m}'
  end

  s.subspec 'SigmobAdapter' do |sigmob|
    sigmob.dependency 'iOS_AdQuestSDK/AdSpot'
    sigmob.dependency 'SigmobAd-iOS', '4.17.0'
    sigmob.source_files =  'Classes/Adapters/Sigmob/**/*.{h,m}'
  end

end
