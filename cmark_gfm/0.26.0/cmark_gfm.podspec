Pod::Spec.new do |s|
  s.name             = 'cmark_gfm'
  s.version          = '0.26.0'
  s.summary          = 'A framework to render markdown UI'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
cmark-gfm is an extended version of the C reference implementation of CommonMark, a rationalized version of Markdown syntax with a spec. This repository adds GitHub Flavored Markdown extensions to the upstream implementation, as defined in the spec.
                       DESC

  s.homepage         = 'https://github.com/gonzalezreal/swift-markdown-ui'
  s.license          = { :type => 'MIT' }
  s.author           = { 'gonzalezreal' => '' }
  s.source           = { :git => 'https://github.com/gonzalezreal/swift-markdown-ui.git', :tag => "2.4.0" }

  s.ios.deployment_target = '16.0'
  s.swift_versions = ["5.0", "5.1"]

  s.source_files = "Sources/cmark-gfm/**/*{.c,.h}"
  s.preserve_paths = "Sources/cmark-gfm/**/*"
  s.public_header_files = "Sources/cmark-gfm/include/*.h"
end
