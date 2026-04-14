Pod::Spec.new do |s|
    s.name             = 'AgentforceVoice'
    s.version          = '1.1.0'
    s.summary          = 'A module for realtime voice communication in the Agentforce Mobile SDK'
  
    s.description      = <<-DESC
  AgentforceVoice provides a module for realtime voice communication in the Agentforce Mobile SDK.
                         DESC
  
    s.homepage         = 'https://github.com/salesforce/AgentforceMobileSDK-iOS'
    s.license          = { :type => 'Salesforce', :file => 'LICENSE.txt'}
    s.author           = { 'Mobile Agentforce SDK' => 'mobile-agentforcesdk-public@salesforce.com' }
    s.source           = { :http => 'https://github.com/salesforce/AgentforceMobileSDK-iOS/releases/download/15.5.1/AgentforceMobileVoice-260-3.xcframework.zip' }
  
    s.ios.deployment_target = '17.0'
    s.swift_versions = ["5.0", "5.1"]
  
    s.vendored_framework = 'AgentforceVoice.xcframework'
    
    s.dependency 'AgentforceService'
    s.dependency 'SalesforceNetwork'
    s.dependency 'SalesforceLogging'
    s.dependency 'LiveKitClient'
  
  end
  