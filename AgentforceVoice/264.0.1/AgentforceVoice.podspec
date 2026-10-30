Pod::Spec.new do |s|
  s.name             = 'AgentforceVoice'
  s.version          = '264.0.1'
  s.summary          = 'Voice capabilities for the Agentforce Mobile SDK'
  s.description      = <<-DESC
AgentforceVoice provides real-time voice interaction capabilities for the Agentforce Mobile SDK, enabling conversational AI experiences through speech in your iOS applications.
                       DESC

  s.homepage         = 'https://github.com/salesforce/AgentforceMobileSDK-iOS'
  s.license          = { :type => 'Salesforce', :file => 'LICENSE.txt' }
  s.author           = { 'Mobile Agentforce SDK' => 'mobile-agentforcesdk-public@salesforce.com' }
  s.source           = { :http => 'https://github.com/salesforce/AgentforceMobileSDK-iOS/releases/download/264.0.1/AgentforceMobileVoice-264-0-1.xcframework.zip' }

  s.ios.deployment_target = '17.0'
  s.swift_versions = ["5.0", "5.1"]

  s.vendored_framework = 'AgentforceVoice.xcframework'

  # Derived from the root podspec at release time (podspec_dependencies.rb).
  s.dependency 'AgentforceService', '264.0.1'
  s.dependency 'SalesforceNetwork'
  s.dependency 'SalesforceLogging'
  s.dependency 'LiveKitClient-XCFramework', '~> 2.16.0'
  s.dependency 'Messaging-InApp-Core', '~> 1.13.0'
  s.dependency 'Messaging-Multimedia-Common', '~> 1.13.0'
  s.dependency 'Messaging-Multimedia-Core', '~> 1.13.0'
end
