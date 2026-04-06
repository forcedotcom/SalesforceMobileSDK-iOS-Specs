Pod::Spec.new do |s|
  s.name             = 'SharedUI'
  s.version          = '1.2.0'
  s.summary          = 'A framework of themeable MCF base components.'
  s.homepage         = 'https://github.com/salesforce/SharedUI-iOS'
  s.license          = { :type => 'Salesforce', :file => 'TERMS_OF_USE.txt' }
  s.author           = { 'Salesforce MNR' => 'mnr-mobile@salesforce.com' }
  s.source           = { :http => 'https://github.com/salesforce/SharedUI-iOS/releases/download/1.2.0/SharedUI.xcframework.zip' }

  s.ios.deployment_target = '17.0'
  s.swift_versions = ["5.0", "5.1"]

  s.vendored_frameworks = 'SharedUI.xcframework'

  s.dependency 'SLDSIcons', '~> 1.2'
end
