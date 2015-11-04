Pod::Spec.new do |s|
  s.name             = "LCTextView"
  s.version          = "1.0.1"
  s.summary          = "UITextview with placeholder 支持placeholder的UITextview"
  s.homepage         = "https://github.com/bawn/LCTextView"
  s.license          = 'MIT'
  s.author           = { "bawn" => "lc5491137@gmail.com" }
  s.source           = { :git => "https://github.com/bawn/LCTextView.git", :tag => s.version.to_s }
  s.platform         = :ios, '7.0'
  s.requires_arc     = true
  s.frameworks       = 'Foundation', 'UIKit'
  s.source_files     = 'LCTextView/*.{h,m}'

end
