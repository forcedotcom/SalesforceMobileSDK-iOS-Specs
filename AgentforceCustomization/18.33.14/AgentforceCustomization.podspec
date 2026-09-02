Pod::Spec.new do |s|
  s.name             = 'AgentforceCustomization'
  s.version          = '18.33.14'
  s.summary          = 'AgentforceCustomization bridges AgentforceSDK to MobileCustomizationFramework via view, data, and image provider adapters.'

  s.description      = <<-DESC
  AgentforceCustomization bridges AgentforceSDK to MobileCustomizationFramework
  via view, data, and image provider adapters.
                       DESC

  s.homepage         = 'https://github.com/salesforce/AgentforceMobileSDK-iOS'
  s.license          = { :type => 'Salesforce', :file => 'LICENSE.txt' }
  s.author           = { 'Mobile Agentforce SDK' => 'mobile-agentforcesdk-public@salesforce.com' }
  # Binary pod: the AgentforceCustomization XCFramework rides on the SDK release
  # (like AgentforceVoice). https://github.com/salesforce/AgentforceMobileSDK-iOS/releases/download/18.33.14/AgentforceMobileCustomization-262-2.xcframework.zip is the dSYM-stripped xcframework zip.
  s.source           = { :http => 'https://github.com/salesforce/AgentforceMobileSDK-iOS/releases/download/18.33.14/AgentforceMobileCustomization-262-2.xcframework.zip' }

  s.ios.deployment_target = '17.0'
  s.swift_versions = ["5.0", "5.1"]

  s.vendored_framework = 'AgentforceCustomization.xcframework'

  s.dependency 'AgentforceSDK', s.version.to_s
  s.dependency 'MobileCustomizationFramework', '~> 6.4'
end
