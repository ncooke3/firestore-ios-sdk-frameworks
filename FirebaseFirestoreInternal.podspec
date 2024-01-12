Pod::Spec.new do |s|
  s.name                   = 'FirebaseFirestoreInternal'
  s.version                = '10.19.0'
  s.summary                = 'A replica Firebase Firestore Internal podspec.'
  s.description            = 'A replica Firebase Firestore podspec that provides pre-compiled binaries/frameworks instead'
  s.homepage               = 'http://invertase.io'
  s.license                = 'Apache-2.0'
  
  s.cocoapods_version      = '>= 1.10.0'
  s.authors                = 'Invertase Limited'
  s.pod_target_xcconfig    = { 'OTHER_LDFLAGS' => '-lObjC' }
  s.static_framework       = true
  s.source       = { :http => 'https://dl.google.com/firebase/ios/bin/firestore/10.19.0/FirebaseFirestoreInternal.zip',
                     :sha256 => '1096ff78a24822bb0218120dfd11859b3b661eb81fc525c9b2cfc044b59804c9' }
  s.platform     = :ios, '11.0'
  s.vendored_frameworks = 'FirebaseFirestoreInternal.xcframework'
end
