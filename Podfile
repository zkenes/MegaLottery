# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'MegaLottery' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MegaLottery
  pod 'FBSDKCoreKit'
  pod 'EasyPeasy'
  pod 'ChameleonFramework', :git => 'https://github.com/ViccAlexander/Chameleon.git', :branch => 'swift3'
  pod 'Typist'
  pod 'BTNavigationDropdownMenu', :git => 'https://github.com/PhamBaTho/BTNavigationDropdownMenu.git', :branch => 'swift-3.0'
  target 'MegaLotteryTests' do
    inherit! :search_paths
    # Pods for testing

  end

  target 'MegaLotteryUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
