Pod::Spec.new do |s|
  s.name         = "UIViewController+VJProgressHUD"
  s.version      = "0.0.1"
  s.summary      = "A UIViewController's Category With MBProgressHUD."
  s.description  = <<-DESC
                    UIViewController+VJProgressHUD is a category of UIViewController with MBProgressHUD.
                    You can easily use the HUD with less code.
                   DESC

  s.homepage     = "https://github.com/victorjiang/UIViewController-VJProgressHUD.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Victor Jiang" => "victorjiang528@gmail.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/victorjiang/UIViewController-VJProgressHUD.git", :tag => "0.0.1" }
  s.source_files  = "Classes"#, "Classes/**/*.{h,m}"
  s.framework  = "UIKit", "CoreGraphics"
  s.requires_arc = true
  s.dependency "MBProgressHUD", "~> 0.9.1"
end
