# coding: utf-8
Pod::Spec.new do |s|
  s.name         = "GoogleDriveManager"
  s.version      = "2.0"
  s.summary      = "GoogleDriveManager"
  s.homepage     = "https://github.com/yu2xzfmd"
  s.license      = { :type => "MIT"}
  s.author       = { "yu2xzfmd" => "yu2xzfmd@gmail.com" }
  s.ios.deployment_target = '9.0'
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/yu2xzfmd/GoogleDriveManager.git", :tag => "#{s.version}" }
  s.source_files  = "GoogleDriveManager", "GoogleDriveManager/*.swift"
  s.requires_arc = true
  s.static_framework = true
  s.dependency "GoogleSignIn"
  s.swift_version = "5.0"
end
