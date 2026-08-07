Pod::Spec.new do |s|
  s.name             = 'MobileCustomizationFramework'
  s.version          = '6.5.3'
  s.summary          = 'Mobile Customization Framework for Salesforce mobile apps.'

  s.homepage         = 'https://github.com/salesforce/MobileCustomizationFramework-iOS'
  s.license          = { :type => 'Salesforce', :file => 'TERMS_OF_USE.txt' }
  s.author           = { 'Salesforce MNR' => 'mnr-mobile@salesforce.com' }
  s.source           = { :http => "https://github.com/salesforce/MobileCustomizationFramework-iOS/releases/download/#{s.version}/MobileCustomizationFramework.xcframework.zip" }

  s.ios.deployment_target = '17.0'
  s.swift_versions = ['5.9']

  s.vendored_frameworks = 'MobileCustomizationFramework.xcframework'

  s.dependency 'SharedUI', '~> 1.5'
  s.dependency 'SLDSIcons', '~> 1.2'
end
