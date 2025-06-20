Pod::Spec.new do |s|
  s.name             = 'AgentforceService'
  s.version          = '2.4.1'
  s.summary          = 'A Framework/Service that supports communicating with the Agentforce system'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
AgentforceService provides a comprehensive toolkit for developers to integrate intelligent, conversational agents into their iOS applications. It handles session management, message passing, and real-time event handling, allowing you to focus on building engaging user interactions.
                       DESC

  s.homepage         = 'https://github.com/forcedotcom/AgentforceMobileService-iOS'
  s.license          = { :type => 'Salesforce', :file => 'LICENSE.txt'}
  s.author           = { 'Mobile Agentforce SDK' => 'mobile-agentforcesdk-public@salesforce.com' }
  s.source           = { :http => 'https://github.com/forcedotcom/AgentforceMobileService-iOS/releases/download/2.4.1/AgentforceMobileService-iOS-2-4-1.zip' }

  s.ios.deployment_target = '16.0'
  s.swift_versions = ["5.0", "5.1"]

  s.vendored_framework = 'AgentforceService.xcframework'
  
  s.dependency 'LDSwiftEventSource'
  s.dependency 'SalesforceNetwork'
  s.dependency 'SalesforceLogging'

end
