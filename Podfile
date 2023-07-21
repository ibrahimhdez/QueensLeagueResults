# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'
inhibit_all_warnings!
source 'https://github.com/CocoaPods/Specs.git'

def shared_pods
  # Firebase
  pod 'Firebase/Firestore'
  pod 'Firebase/Storage'
  #pod 'Firebase/Analytics'
  #pod 'Firebase/RemoteConfig'

end

target 'QueensLeagueResults' do
  # Comment the next line if you don't want to use dynamic frameworks
 
 # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  shared_pods
  
  # Pods for QueensLeagueResults
  #pod 'Firebase/Messaging'
  #pod 'Firebase/Crashlytics'
  
  # Navigation
  #pod 'NavigationStack'
  
  # Pipeline azure
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
        config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
        config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
        if config.name == 'Debug'
          config.build_settings['ENABLE_TESTABILITY'] = 'YES'
        end
      end
    end
  end
  
  target 'QueensLeagueResultsTests' do
    use_frameworks!
    inherit! :search_paths
    pod 'SnapshotTesting', '~> 1.7.2'
    pod 'OHHTTPStubs/Swift'
  end
  
end


