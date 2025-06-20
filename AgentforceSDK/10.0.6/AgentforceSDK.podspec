Pod::Spec.new do |s|
  s.name             = 'AgentforceSDK'
  s.version          = '10.0.6'
  s.summary          = 'The AgentforceSDK provides primary entry point for displaying the AI Container, managing view model, and communicating with the back end “Conversation Platform”'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
The Agentforce Mobile SDK empowers you to integrate Salesforce's feature-rich, trusted AI platform directly into your native iOS and Android mobile applications. By leveraging the Agentforce Mobile SDK, you can deliver cutting-edge, intelligent, and conversational AI experiences to your mobile users, enhancing engagement and providing seamless access to information and actions.
                       DESC

  s.homepage         = 'https://https://github.com/salesforce/AgentforceMobileSDK-iOS'
  s.license          = { :type => 'Salesforce', :file => 'LICENSE.txt' }
  s.author           = { 'Mobile Agentforce SDK' => 'mobile-agentforcesdk-public@salesforce.com'  }
  s.source           = { :http => 'https://github.com/salesforce/AgentforceMobileSDK-iOS/releases/download/10.0.6/AgentforceMobileSDK-iOS-10-0-6.zip' }

  s.ios.deployment_target = '17.0'
  s.swift_versions = ["5.0", "5.1"]
  
  s.vendored_framework = 'AgentforceSDK.xcframework'

  s.dependency 'AgentforceService', '>= 2.1.1'
  s.dependency 'SalesforceNavigation'
  s.dependency 'SalesforceLogging'
  s.dependency 'SalesforceNetwork'
  s.dependency 'SalesforceUser'
  s.dependency 'swift-markdown-ui'
end
