# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  app.name = 'MyEvents'

  app.frameworks    = ["UIKit", "Foundation", 'AdSupport', 'Accounts', 'Social', 'MapKit']
  app.weak_frameworks += %w{ AdSupport Accounts Social }

  app.pods do
    pod 'Facebook-iOS-SDK', '~> 3.1.1'
  end

  app.device_family          = :iphone
  app.interface_orientations = [:portrait]

  app.info_plist['FacebookAppID'] = '124979164366317'
  app.info_plist['URL types'] = { 'URL Schemes' => 'fb124979164366317'}
end
