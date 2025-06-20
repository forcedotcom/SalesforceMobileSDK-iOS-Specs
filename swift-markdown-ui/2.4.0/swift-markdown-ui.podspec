Pod::Spec.new do |s|
  s.name             = 'swift-markdown-ui'
  s.version          = '2.4.0'
  s.summary          = 'A framework to render markdown UI'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
MarkdownUI is a powerful library for displaying and customizing Markdown text in SwiftUI. It is compatible with the GitHub Flavored Markdown Spec and can display images, headings, lists (including task lists), blockquotes, code blocks, tables, and thematic breaks, besides styled text and links.
                       DESC

  s.homepage         = 'https://github.com/gonzalezreal/swift-markdown-ui'
  s.license          = { :type => 'MIT' }
  s.author           = { 'gonzalezreal' => '' }
  s.source           = { :git => 'https://github.com/gonzalezreal/swift-markdown-ui.git', :tag => "2.4.0" }

  s.ios.deployment_target = '15.0'
  s.swift_versions = ["5.0", "5.1"]
  s.dependency 'NetworkImage'
  s.dependency 'cmark_gfm', '~> 0.26'

  _source_files = 'Sources/MarkdownUI/**/*.swift'
  s.source_files = _source_files
end