Pod::Spec.new do |s|
    s.name         = "Messaging-InApp-Core"
    s.version      = "1.9.3-Experimental"
    s.summary      = "Core iOS framework for 'Messaging For In-App'"

    s.homepage     = "https://developer.salesforce.com/docs/service/messaging-in-app/overview"
    s.license      = { :type => "BSD", :file => "LICENSE.md" }
    s.author       = { "Salesforce" => "Salesforce" }
    s.platform     = :ios, "12.0"
    s.source       = { :http => "https://salesforce-async-messaging-experimental.s3.us-east-1.amazonaws.com/public/ios/1.9.3-Experimental/SMIClientCore-Release.xcframework.zip"}
    s.vendored_frameworks = "SMIClientCore.xcframework"
    s.requires_arc = true
end

