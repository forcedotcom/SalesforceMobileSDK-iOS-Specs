Pod::Spec.new do |s|
  s.name             = 'AgentforceService'
  s.version          = '264.0.0'
  s.summary          = 'A Framework/Service that supports communicating with the Agentforce system'
  s.description      = <<-DESC
AgentforceService provides a comprehensive toolkit for developers to integrate intelligent, conversational agents into their iOS applications. It handles session management, message passing, and real-time event handling, allowing you to focus on building engaging user interactions.
                       DESC

  s.homepage         = 'https://github.com/forcedotcom/AgentforceMobileService-iOS'
  s.license          = { :type => 'Salesforce', :file => 'LICENSE.txt'}
  s.author           = { 'Mobile Agentforce SDK' => 'mobile-agentforcesdk-public@salesforce.com' }
  s.source           = { :http => 'https://github.com/forcedotcom/AgentforceMobileService-iOS/releases/download/264.0.0/AgentforceMobileService-264-0.xcframework.zip' }

  s.ios.deployment_target = '17.0'
  s.swift_versions = ["5.0", "5.1"]

  s.vendored_framework = 'AgentforceService.xcframework'

  # Derived from the root podspec at release time (podspec_dependencies.rb).
  s.dependency 'SalesforceLogging', '~> 1.0'
  s.dependency 'SalesforceNavigation', '~> 1.0'
  s.dependency 'SalesforceNetwork', '~> 1.0'
  s.dependency 'SalesforceUser', '~> 1.0'
  s.dependency 'Messaging-InApp-Core', '~> 1.13.0'
  s.dependency 'Messaging-Multimedia-Common', '~> 1.13.0'
end
