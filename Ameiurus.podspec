Pod::Spec.new do |s|
s.name         = "Ameiurus"
s.version      = "1.0.4"
s.summary      = "Chat bot for ios"
s.homepage     = "https://github.com/Taishoberius/Ameiurus"
s.license      = { :type => "BSD", :file => "LICENSE" }
s.author       = { "ESGI" => "contact@esgi.fr" }
s.source       = { :git => "https://github.com/Taishoberius/Ameiurus.git", :tag => "v#{s.version}" }
s.source_files = 'Ameiurus/**/*.{swift,h}'
s.ios.deployment_target = '9.0'
s.swift_version = '4.2'
s.dependency 'Alamofire', '~> 4.8'
end
