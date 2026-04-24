Pod::Spec.new do |s|
  s.name             = 'AgentforceVoice'
  s.version          = '1.2.0'
  s.summary          = 'Voice capabilities for the Agentforce Mobile SDK'
  s.description      = <<-DESC
AgentforceVoice provides real-time voice interaction capabilities for the Agentforce Mobile SDK, enabling conversational AI experiences through speech in your iOS applications.
                       DESC

  s.homepage         = 'https://github.com/salesforce/AgentforceMobileSDK-iOS'
  s.license          = { :type => 'Salesforce', :file => 'LICENSE.txt' }
  s.author           = { 'Mobile Agentforce SDK' => 'mobile-agentforcesdk-public@salesforce.com' }
  s.source           = { :http => 'https://github.com/salesforce/AgentforceMobileSDK-iOS/releases/download/15.7.6/AgentforceMobileVoice-260-4.xcframework.zip' }

  s.ios.deployment_target = '17.0'
  s.swift_versions = ["5.0", "5.1"]

  s.vendored_framework = 'AgentforceVoice.xcframework'

  s.dependency 'AgentforceService', '~> 5'
  s.dependency 'SalesforceNetwork'
  s.dependency 'SalesforceLogging'
end
