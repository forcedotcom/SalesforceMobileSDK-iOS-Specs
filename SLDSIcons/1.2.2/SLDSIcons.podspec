Pod::Spec.new do |s|
  s.name             = 'SLDSIcons'
  s.version          = '1.2.2'
  s.summary          = 'Salesforce Lightning Design System Icons for iOS.'
  s.homepage         = 'https://github.com/salesforce/SLDSIcons-iOS'
  s.license          = { :type => 'Salesforce', :file => 'TERMS_OF_USE.txt' }
  s.author           = { 'Salesforce MNR' => 'mnr-mobile@salesforce.com' }
  s.source           = { :http => 'https://github.com/salesforce/SLDSIcons-iOS/releases/download/1.2.2/SLDSIcons.xcframework.zip' }

  s.ios.deployment_target = '17.0'
  s.swift_versions = ["5.7"]

  s.vendored_frameworks = 'SLDSIcons.xcframework'
end
