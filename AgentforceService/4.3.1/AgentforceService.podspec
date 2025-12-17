Pod::Spec.new do |s|
  s.name             = 'AgentforceService'
  s.version          = '4.3.1'
  s.summary          = 'A Framework/Service that supports communicating with the Agentforce system'
  s.description      = <<-DESC
AgentforceService provides a comprehensive toolkit for developers to integrate intelligent, conversational agents into their iOS applications. It handles session management, message passing, and real-time event handling, allowing you to focus on building engaging user interactions.
                       DESC

  s.homepage         = 'https://github.com/forcedotcom/AgentforceMobileService-iOS'
  s.license          = { :type => 'Salesforce', :file => 'LICENSE.txt'}
  s.author           = { 'Mobile Agentforce SDK' => 'mobile-agentforcesdk-public@salesforce.com' }
  s.source           = { :http => 'https://github.com/forcedotcom/AgentforceMobileService-iOS/releases/download/4.3.1/AgentforceMobileService-258-2.xcframework.zip' }

  s.ios.deployment_target = '16.0'
  s.swift_versions = ["5.0", "5.1"]

  s.vendored_framework = 'AgentforceService.xcframework'
  
  s.dependency 'SalesforceNetwork'
  s.dependency 'SalesforceLogging'
  s.dependency 'LiveKitClient'
  s.dependency 'Messaging-InApp-Core', '> 1.9.2'
end
