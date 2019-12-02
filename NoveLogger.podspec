Pod::Spec.new do |spec|
  spec.name = "NoveLogger"
  spec.version = "1.0.0"
  spec.summary = "A Swift logger for iOS"
  spec.description = <<-DESC
    A lightweight, yet powerful logger for your Swift projects.
  DESC
  spec.homepage = "https://github.com/sgigou/NoveLogger"
  spec.license = { :type => "MIT", :file => "LICENSE" }
  spec.author = { "Steve Gigou" => "steve@gigou.fr" }
  spec.social_media_url = "https://twitter.com/SteveGigou"
  spec.ios.deployment_target = "9.0"
  spec.osx.deployment_target = "10.15"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"
  spec.source = { :git => "https://github.com/sgigou/NoveLogger.git", :tag => "#{spec.version}" }
  spec.source_files  = "NoveLogger"
  spec.swift_versions = "5.0"
end
