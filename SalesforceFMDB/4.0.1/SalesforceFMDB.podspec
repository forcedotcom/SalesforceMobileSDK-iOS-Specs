Pod::Spec.new do |s|

  s.name         = "SalesforceFMDB"
  s.module_name  = "FMDB"
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
  s.default_subspec  = 'SalesforceFMDB'

  s.subspec 'SalesforceFMDB' do |salesforcefmdb|

      salesforcefmdb.source_files = 'external/fmdb/src/fmdb/FM*.{h,m}'
      salesforcefmdb.exclude_files = 'external/fmdb/src/fmdb.m'
      salesforcefmdb.xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_HAS_CODEC' }
      salesforcefmdb.dependency 'SQLCipher/fts', '~> 3.3.1'
  end

end
