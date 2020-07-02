require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-naver-login"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-naver-login
                   DESC
  s.homepage     = "https://github.com/ibigtree/react-native-naver-login"
  # brief license entry:
  s.license      = "MIT"
  # optional - use expanded license entry instead:
  # s.license    = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Daehan Kim" => "daehankim@ibigtree.kr" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/ibigtree/react-native-naver-login.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,c,m,swift}"
  s.requires_arc = true

  s.dependency "React"
  s.dependency "naveridlogin-sdk-ios", "~> 4.1"
end

