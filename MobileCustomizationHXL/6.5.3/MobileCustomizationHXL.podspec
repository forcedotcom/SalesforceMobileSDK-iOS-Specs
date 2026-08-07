Pod::Spec.new do |s|
  s.name             = 'MobileCustomizationHXL'
  s.version          = '6.5.3'
  s.summary          = 'HXL variant of MobileCustomizationFramework: renders HXL metadata via AgentforceHxlEngine.'

  s.description      = <<-DESC
  MobileCustomizationHXL ships the HXL rendering layer on top of MobileCustomizationFramework.
  It bundles the AgentforceHxlEngine and links JavaScriptCore.
  Distributed as a companion xcframework to MobileCustomizationFramework.
                       DESC

  s.homepage         = 'https://github.com/salesforce/MobileCustomizationFramework-iOS'
  s.license          = { :type => 'Salesforce', :file => 'TERMS_OF_USE.txt' }
  s.author           = { 'Salesforce MNR' => 'mnr-mobile@salesforce.com' }
  s.source           = { :http => "https://github.com/salesforce/MobileCustomizationFramework-iOS/releases/download/#{s.version}/MobileCustomizationHXL.xcframework.zip" }

  s.ios.deployment_target = '17.0'
  s.swift_versions = ['5.9']

  s.vendored_frameworks = 'MobileCustomizationHXL.xcframework'

  s.dependency 'MobileCustomizationFramework', s.version.to_s
  s.frameworks = 'JavaScriptCore'
end
