Pod::Spec.new do |s|
  s.name             = 'MobileCustomizationFramework'
  s.version          = '6.1.4'
  s.summary          = 'A Framework that converts UEM to Mobile Customization UX Components.'
  s.homepage         = 'https://github.com/salesforce/MobileCustomizationFramework-iOS'
  s.license          = { :type => 'Salesforce', :file => 'TERMS_OF_USE.txt' }
  s.author           = { 'Salesforce MNR' => 'mnr-mobile@salesforce.com' }
  s.source           = { :http => 'https://github.com/salesforce/MobileCustomizationFramework-iOS/releases/download/6.1.4/MobileCustomizationFramework.xcframework.zip' }

  s.ios.deployment_target = '17.0'
  s.swift_versions = ["5.0", "5.1"]

  s.vendored_frameworks = 'MobileCustomizationFramework.xcframework'

  s.dependency 'SharedUI', '~> 1.2'
  s.dependency 'SLDSIcons', '~> 1.2'
  s.dependency 'SalesforceNavigation'
  s.dependency 'SalesforceLogging'
  s.dependency 'SalesforceNetwork'
  s.dependency 'SalesforceUser'
  s.dependency 'SalesforceCache'
end
