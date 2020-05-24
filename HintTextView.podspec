Pod::Spec.new do |s|

  s.name = "HintTextView"
  s.version = "1.0.4"
  s.summary = "UITextView support PlaceHolder."
  s.homepage = "https://github.com/outofcoding/HintTextView"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "OutOfCode" => "outofcoding@gmail.com" }
  s.source = { :git => "https://github.com/outofcoding/HintTextView.git", :tag => "#{s.version}" }
  s.source_files = 'Sources/**/*'
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.ios.framework = 'UIKit'
  s.swift_version = '4.0'

end
