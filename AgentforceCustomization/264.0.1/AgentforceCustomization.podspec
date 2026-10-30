Pod::Spec.new do |s|
  s.name             = 'AgentforceCustomization'
  s.version          = '264.0.1'
  s.summary          = 'AgentforceCustomization bridges AgentforceSDK to MobileCustomizationFramework via view, data, and image provider adapters.'

  s.description      = <<-DESC
  AgentforceCustomization bridges AgentforceSDK to MobileCustomizationFramework
  via view, data, and image provider adapters.
                       DESC

  s.homepage         = 'https://github.com/salesforce/AgentforceMobileSDK-iOS'
  s.license          = { :type => 'Salesforce', :file => 'LICENSE.txt' }
  s.author           = { 'Mobile Agentforce SDK' => 'mobile-agentforcesdk-public@salesforce.com' }
  # Binary pod: the AgentforceCustomization XCFramework rides on the SDK release
  # (like AgentforceVoice). https://github.com/salesforce/AgentforceMobileSDK-iOS/releases/download/264.0.1/AgentforceMobileCustomization-264-0-1.xcframework.zip is the dSYM-stripped xcframework zip.
  s.source           = { :http => 'https://github.com/salesforce/AgentforceMobileSDK-iOS/releases/download/264.0.1/AgentforceMobileCustomization-264-0-1.xcframework.zip' }

  s.ios.deployment_target = '17.0'
  s.swift_versions = ["5.0", "5.1"]

  s.vendored_framework = 'AgentforceCustomization.xcframework'

  # Derived from the root podspec at release time (podspec_dependencies.rb).
  s.dependency 'AgentforceSDK', '264.0.1'
  s.dependency 'MobileCustomizationFramework', '~> 6.5.33'
  s.dependency 'MobileCustomizationHXL', '~> 6.5.33'
end
