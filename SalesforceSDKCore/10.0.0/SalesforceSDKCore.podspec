Pod::Spec.new do |s|

  s.name         = "SalesforceSDKCore"
  s.version      = "10.0.0"
  s.summary      = "Salesforce Mobile SDK for iOS"
  s.homepage     = "https://github.com/forcedotcom/SalesforceMobileSDK-iOS"

  s.license      = { :type => "Salesforce.com Mobile SDK License", :file => "LICENSE.md" }
  s.author       = { "Kevin Hawkins" => "khawkins@salesforce.com" }

  s.platform     = :ios, "14.0"
  s.swift_versions = ['5.0']

  s.source       = { :git => "https://github.com/forcedotcom/SalesforceMobileSDK-iOS.git",
                     :tag => "v#{s.version}",
                     :submodules => true }

  s.frameworks   = 'CoreTelephony'

  s.requires_arc = true
  s.default_subspec  = 'SalesforceSDKCore'

  s.subspec 'SalesforceSDKCore' do |sdkcore|

      sdkcore.dependency 'SalesforceAnalytics', "~>#{s.version}"
      sdkcore.libraries = 'z'
      sdkcore.resource_bundles = { 'SalesforceSDKResources' => [ 'shared/resources/SalesforceSDKResources.bundle/**' ] }
      sdkcore.resource = 'shared/resources/SalesforceSDKAssets.xcassets'

      # subspec for code that any of the source_files of no-arc depend on
      sdkcore.subspec 'base' do |sp|
          sp.source_files = 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SalesforceSDKConstants.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSData+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSData+SFAdditions.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSString+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSString+SFAdditions.m','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSNotificationCenter+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSNotificationCenter+SFAdditions.m'
          sp.public_header_files = 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SalesforceSDKConstants.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSData+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSString+SFAdditions.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSNotificationCenter+SFAdditions.h'
          sp.requires_arc = true
          sp.prefix_header_contents = '#import "SFSDKCoreLogger.h"', '#import "SalesforceSDKConstants.h"'
      end

      # subspec for code that doesn't support arc
      sdkcore.subspec 'no-arc' do |sp|
          sp.dependency 'SalesforceSDKCore/SalesforceSDKCore/base'
          sp.source_files = 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFKeychainItemWrapper.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFKeychainItemWrapper+Internal.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFKeychainItemWrapper.m'
          sp.public_header_files = 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFKeychainItemWrapper.h'
          sp.requires_arc = false
          sp.prefix_header_contents = '#import "SFSDKCoreLogger.h"', '#import "SalesforceSDKConstants.h"'
      end

      # subspec for everything else
      # exclude_files should be the source_files from the base subspec plus the ones from the arc subspec
      # public_header_files is automatically populated by update_podspec_headers.sh which is run when building SalesforceSDKCore
      sdkcore.subspec 'arc' do |sdkcore|
          sdkcore.dependency 'SalesforceSDKCore/SalesforceSDKCore/base'
          sdkcore.dependency 'SalesforceSDKCore/SalesforceSDKCore/no-arc'
          sdkcore.source_files = 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/**/*.{h,m,swift}', 'libs/SalesforceSDKCore/SalesforceSDKCore/SalesforceSDKCore.h'
          sdkcore.exclude_files = 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SalesforceSDKConstants.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSData+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSData+SFAdditions.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSString+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSString+SFAdditions.m','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSNotificationCenter+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSNotificationCenter+SFAdditions.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFKeychainItemWrapper.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFKeychainItemWrapper+Internal.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFKeychainItemWrapper.m'
          sdkcore.public_header_files = 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Analytics/SFSDKAILTNPublisher.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Analytics/SFSDKAnalyticsPublisher.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Analytics/SFSDKEventBuilderHelper.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Analytics/SFSDKSalesforceAnalyticsManager.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSArray+SFAdditions.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSData+SFSDKUtils.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSDictionary+SFAdditions.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSObject+SFBlocks.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSURL+SFAdditions.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSURLResponse+SFAdditions.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFApplication.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFFormatUtils.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFInactivityTimerCenter.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFSDKAppConfig.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFSDKAppFeatureMarkers.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFSDKWebViewStateManager.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SalesforceSDKManager.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/UIDevice+SFHardware.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/UIScreen+SFAdditions.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/IDP/SFSDKLoginFlowSelectionView.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/IDP/SFSDKUITableViewCell.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/IDP/SFSDKUserSelectionNavViewController.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/IDP/SFSDKUserSelectionTableViewController.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/IDP/SFSDKUserSelectionView.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Identity/SFIdentityCoordinator.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Identity/SFIdentityData.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Instrumentation/SFInstrumentation.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Instrumentation/SFMethodInterceptor.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Instrumentation/SFSDKInstrumentationHelper.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Login/LoginHost/SFSDKLoginHost.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Login/LoginHost/SFSDKLoginHostDelegate.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Login/LoginHost/SFSDKLoginHostListViewController.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Login/LoginHost/SFSDKLoginHostStorage.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Login/SFLoginViewController.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Login/SFSDKLoginViewControllerConfig.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/OAuth/SFOAuthCoordinator.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/OAuth/SFOAuthCredentials.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/OAuth/SFOAuthInfo.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/OAuth/SFOAuthOrgAuthConfiguration.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/OAuth/SFOAuthSessionRefresher.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Protocols/SFSDKAppDelegate.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/PushNotification/SFPushNotificationManager.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/PushNotification/SFSDKPushNotificationDecryption.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/PushNotification/SFSDKPushNotificationError.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/PushNotification/SFSDKPushNotificationFieldsConstants.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/RestAPI/SFNetwork.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/RestAPI/SFRestAPI+Blocks.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/RestAPI/SFRestAPI+Files.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/RestAPI/SFRestAPI+Notifications.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/RestAPI/SFRestAPI+QueryBuilder.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/RestAPI/SFRestAPI.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/RestAPI/SFRestRequest.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/RestAPI/SFSDKBatchRequest.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/RestAPI/SFSDKBatchResponse.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/RestAPI/SFSDKCompositeRequest.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/RestAPI/SFSDKCompositeResponse.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/RestAPI/SFSObjectTree.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFCryptChunks.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFDecryptStream.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFEncryptionKey.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFKeyStoreManager.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFSDKCryptoUtils.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFSecureEncryptionKey.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Test/SFSDKAsyncProcessListener.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Test/SFSDKTestCredentialsData.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Test/SFSDKTestRequestListener.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Test/TestSetupUtils.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/UserAccount/SFAuthErrorHandlerList.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/UserAccount/SFUserAccount.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/UserAccount/SFUserAccountConstants.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/UserAccount/SFUserAccountIdentity.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/UserAccount/SFUserAccountManager.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/UserAccount/ViewControllers/SFDefaultUserManagementDetailViewController.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/UserAccount/ViewControllers/SFDefaultUserManagementListViewController.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/UserAccount/ViewControllers/SFDefaultUserManagementViewController.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/NSURL+SFStringUtils.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFApplicationHelper.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFDirectoryManager.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFManagedPreferences.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFPreferences.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFSDKAuthConfigUtil.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFSDKAuthHelper.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFSDKCoreLogger.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFSDKOAuth2.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFSDKResourceUtils.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFSDKSoqlBuilder.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFSDKSoslBuilder.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFSDKSoslReturningBuilder.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFSDKViewControllerConfig.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFSDKWebUtils.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SalesforceSDKCoreDefines.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/UIColor+SFColors.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Views/SFSDKAlertMessage.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Views/SFSDKAlertMessageBuilder.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Views/SFSDKDevInfoViewController.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Views/SFSDKNavigationController.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Views/SFSDKViewController.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Views/SFSDKWindowContainer.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Views/SFSDKWindowManager.h','libs/SalesforceSDKCore/SalesforceSDKCore/SalesforceSDKCore.h'
          sdkcore.requires_arc = true
          sdkcore.prefix_header_contents = '#import "SFSDKCoreLogger.h"', '#import "SalesforceSDKConstants.h"'
      end

  end

end