Pod::Spec.new do |s|
  s.name         = "AOInfoNetManager"
  s.version      = "0.0.2"
  s.summary      = "Parse client manager for Info APP"
  s.description  = "Networking part of inforamtion app"
  s.homepage     = "https://github.com/alekoleg/AOInfoNetManager.git"
  s.license      = 'MIT'
  s.author       = { "Oleg Alekseenko" => "alekoleg@gmail.com" }
  s.source       = { :git => "https://github.com/alekoleg/AOInfoNetManager.git", :tag => s.version.to_s}
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes/**/*.{h,m}'
  s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'Foundation', 'UIKit'
  s.dependency 'AFNetworking', '~> 2.5.2'
  s.dependency 'Mantle', '~> 1.5.1'

end
