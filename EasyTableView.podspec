Pod::Spec.new do |s|

s.name              = 'EasyTableView'
s.version           = '0.0.1'
s.summary           = 'EasyTableView'
s.homepage          = 'https://github.com/mcmatan/EasyTableView'
s.ios.deployment_target = '8.0'
s.platform = :ios, '8.0'
s.license           = {
:type => 'MIT',
:file => 'LICENSE'
}
s.author            = {
'YOURNAME' => 'Matan'
}
s.source            = {
:git => 'https://github.com/mcmatan/EasyTableView.git',
:tag => "#{s.version}" }

s.framework = "UIKit"
s.source_files      = 'EasyTableView*' , 'Vendor/*', 'Resource/*', 'EasyTableView/*'
s.requires_arc      = true

end