Pod::Spec.new do |s|
  s.name             = 'AgentforceCustomization'
  s.version          = '18.33.14-rc1'
  s.summary          = 'AgentforceCustomization bridges AgentforceSDK to MobileCustomizationFramework via view, data, and image provider adapters.'

  s.description      = <<-DESC
  AgentforceCustomization bridges AgentforceSDK to MobileCustomizationFramework
  via view, data, and image provider adapters. Distributed as a source-only pod.
                       DESC

  s.homepage         = 'https://github.com/salesforce/AgentforceMobileSDK-iOS'
  s.license          = { :type => 'Salesforce', :file => 'LICENSE.txt' }
  s.author           = { 'Mobile Agentforce SDK' => 'mobile-agentforcesdk-public@salesforce.com' }
  s.source           = { :git => 'https://github.com/salesforce/AgentforceMobileSDK-iOS.git', :tag => s.version.to_s }

  s.ios.deployment_target = '17.0'
  s.swift_versions = ["5.0", "5.1"]

  # Source-only pod: ships the adapter sources, compiled from source by consumers.
  s.source_files = 'AgentforceCustomization/**/*.{swift,m}'

  s.dependency 'AgentforceSDK', s.version.to_s
  s.dependency 'MobileCustomizationFramework', '~> 6.4'
end
