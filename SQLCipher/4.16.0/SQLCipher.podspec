Pod::Spec.new do |s|
  s.name         = "SQLCipher"
  s.version      = "4.16.0"
  s.summary      = "Full Database Encryption for SQLite."
  s.description  = "SQLCipher is an open source extension to SQLite that provides transparent 256-bit AES encryption of database files."
  s.homepage     = "https://www.zetetic.net/sqlcipher/"
  s.license      = { :type => "BSD-3-Clause", :file => "LICENSE.txt" }
  s.author       = "Zetetic LLC"

  s.source       = { :git => "https://github.com/sqlcipher/sqlcipher.git",
                     :tag => "v#{s.version}" }

  s.platform     = :ios, "12.0"
  s.ios.deployment_target = "12.0"
  s.osx.deployment_target = "10.13"
  s.tvos.deployment_target = "12.0"
  s.watchos.deployment_target = "7.0"

  s.requires_arc = false
  s.default_subspec = "standard"

  s.prepare_command = "./configure && make sqlite3.c"

  # Common subspec - base configuration
  s.subspec "common" do |ss|
    ss.source_files = "sqlite3.{h,c}"
    ss.frameworks = "Foundation", "Security"
    ss.resource_bundles = { "SQLCipher" => ["sqlcipher-resources/PrivacyInfo.xcprivacy"] }

    ss.compiler_flags = [
      "-DNDEBUG",
      "-DSQLITE_HAS_CODEC",
      "-DSQLITE_TEMP_STORE=2",
      "-DSQLITE_SOUNDEX",
      "-DSQLITE_THREADSAFE",
      "-DSQLITE_ENABLE_RTREE",
      "-DSQLITE_ENABLE_STAT3",
      "-DSQLITE_ENABLE_STAT4",
      "-DSQLITE_ENABLE_COLUMN_METADATA",
      "-DSQLITE_ENABLE_MEMORY_MANAGEMENT",
      "-DSQLITE_ENABLE_LOAD_EXTENSION",
      "-DSQLITE_ENABLE_FTS4",
      "-DSQLITE_ENABLE_FTS4_UNICODE61",
      "-DSQLITE_ENABLE_FTS3_PARENTHESIS",
      "-DSQLITE_ENABLE_UNLOCK_NOTIFY",
      "-DSQLITE_ENABLE_JSON1",
      "-DSQLITE_ENABLE_FTS5",
      "-DSQLCIPHER_CRYPTO_CC",
      "-DHAVE_USLEEP=1",
      "-DSQLITE_MAX_VARIABLE_NUMBER=99999",
      "-DSQLITE_EXTRA_INIT=sqlcipher_extra_init",
      "-DSQLITE_EXTRA_SHUTDOWN=sqlcipher_extra_shutdown"
    ].join(" ")

    ss.xcconfig = {
      "HEADER_SEARCH_PATHS" => "$(PODS_ROOT)/SQLCipher",
      "GCC_PREPROCESSOR_DEFINITIONS" => "SQLITE_HAS_CODEC=1",
      "OTHER_CFLAGS" => "$(inherited) -DSQLITE_HAS_CODEC -DSQLITE_TEMP_STORE=2 -DSQLITE_SOUNDEX -DSQLITE_THREADSAFE -DSQLITE_ENABLE_RTREE -DSQLITE_ENABLE_STAT3 -DSQLITE_ENABLE_STAT4 -DSQLITE_ENABLE_COLUMN_METADATA -DSQLITE_ENABLE_MEMORY_MANAGEMENT -DSQLITE_ENABLE_LOAD_EXTENSION -DSQLITE_ENABLE_FTS4 -DSQLITE_ENABLE_FTS4_UNICODE61 -DSQLITE_ENABLE_FTS3_PARENTHESIS -DSQLITE_ENABLE_UNLOCK_NOTIFY -DSQLITE_ENABLE_JSON1 -DSQLITE_ENABLE_FTS5 -DSQLCIPHER_CRYPTO_CC -DHAVE_USLEEP=1 -DSQLITE_MAX_VARIABLE_NUMBER=99999 -DSQLITE_EXTRA_INIT=sqlcipher_extra_init -DSQLITE_EXTRA_SHUTDOWN=sqlcipher_extra_shutdown"
    }

    ss.user_target_xcconfig = {
      "GCC_PREPROCESSOR_DEFINITIONS" => "_SQLITE3_H_=1 _FTS5_H=1 _SQLITE3RTREE_H_=1"
    }
  end

  # Standard subspec - default configuration
  s.subspec "standard" do |ss|
    ss.dependency "SQLCipher/common"
  end

  # FTS subspec - Full Text Search
  s.subspec "fts" do |ss|
    ss.dependency "SQLCipher/common"
    ss.compiler_flags = ""
    ss.xcconfig = {
      "OTHER_CFLAGS" => "$(inherited)"
    }
  end

  # Unlock Notify subspec
  s.subspec "unlock_notify" do |ss|
    ss.dependency "SQLCipher/common"
    ss.compiler_flags = ""
    ss.xcconfig = {
      "OTHER_CFLAGS" => "$(inherited)"
    }
  end
end
