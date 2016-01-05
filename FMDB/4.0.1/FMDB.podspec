Pod::Spec.new do |s|

  s.name         = "FMDB"
  s.version      = "4.0.1"
  s.summary      = "A Cocoa / Objective-C wrapper around SQLite - Salesforce Mobile SDK fork"
  s.homepage     = "https://github.com/ccgus/fmdb"

  s.license      = "MIT"
  s.author       = { "August Mueller" => "gus@flyingmeat.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/forcedotcom/SalesforceMobileSDK-iOS.git",
                     :tag => "pod_v#{s.version}",
                     :submodules => true }

  s.requires_arc = true
  s.default_subspec  = 'SQLCipher'

  s.subspec 'SQLCipher' do |sqlcipher|

      sqlcipher.source_files = 'external/fmdb/src/fmdb/FM*.{h,m}'
      sqlcipher.exclude_files = 'external/fmdb/src/fmdb.m'
      sqlcipher.xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_HAS_CODEC -DHAVE_USLEEP=1' }
      sqlcipher.preserve_paths = 'external/ThirdPartyDependencies/sqlcipher/LICENSE'
      sqlcipher.vendored_libraries = 'external/ThirdPartyDependencies/sqlcipher/libsqlcipher.a'
      
  end

end
