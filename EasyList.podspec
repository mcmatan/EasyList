Pod::Spec.new do |s|

s.name              = 'EasyList'
s.version           = '0.1.4'
s.summary           = 'EasyList'
s.homepage          = 'https://github.com/mcmatan/EasyList'
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
:git => 'https://github.com/mcmatan/EasyList.git' ,
:tag => "#{s.version}" }

s.framework = "UIKit"
s.source_files      = 'EasyList*' , 'Vendor/*', 'Resource/*', 'EasyList/classes/*'
s.requires_arc      = true

end
