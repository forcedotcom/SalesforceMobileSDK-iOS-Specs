Pod::Spec.new do |s|
  s.name             = 'NetworkImage'
  s.version          = '6.0.1'
  s.summary          = 'A framework to render markdown UI'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
NetworkImage is a Swift package that provides image downloading, caching, and displaying for your SwiftUI apps. It leverages the foundation URLCache and NSCache, providing persistent and in-memory caches.
                       DESC

  s.homepage         = 'https://github.com/gonzalezreal/NetworkImage'
  s.license          = { :type => 'MIT' }
  s.author           = { 'gonzalezreal' => '' }
  s.source           = { :git => 'https://github.com/gonzalezreal/NetworkImage.git', :tag => s.version.to_s }

  s.ios.deployment_target = '16.0'
  s.swift_versions = ["5.0", "5.1"]
  _source_files = 'Sources/NetworkImage/**/*.swift'
  s.source_files = _source_files
end
