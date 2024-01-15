firebase_firestore_version = '10.19.0'

Pod::Spec.new do |s|
  s.name                   = 'FirebaseFirestoreInternal-Invertase'
  s.version                = firebase_firestore_version
  s.summary                = 'A replica Firebase FirestoreInternal podspec.'
  s.description            = 'A replica Firebase FirestoreInternal podspec that provides pre-compiled binaries/frameworks instead'
  s.homepage               = 'http://invertase.io'
  s.license                = 'Apache-2.0'
  s.source                 = { 
    :git => 'https://github.com/firebase/firebase-ios-sdk.git',
    :tag => 'CocoaPods-' + s.version.to_s
  }
  s.cocoapods_version      = '>= 1.10.0'
  s.authors                = 'Invertase Limited'
  s.pod_target_xcconfig    = { 'OTHER_LDFLAGS' => '-lObjC' }
  s.static_framework       = true

  # These frameworks, minimums, and the c++ library are here from, and copied specifically to match, the upstream podspec:
  # https://github.com/firebase/firebase-ios-sdk/blob/34c4bdbce23f5c6e739bda83b71ba592d6400cd5/FirebaseFirestore.podspec#L103
  # They may need updating periodically.
  s.ios.frameworks         = 'SystemConfiguration', 'UIKit'
  s.osx.frameworks         = 'SystemConfiguration'
  s.tvos.frameworks        = 'SystemConfiguration', 'UIKit'
  s.library                = 'c++'
  s.ios.deployment_target  = '11.0'
  s.osx.deployment_target  = '10.13'
  s.tvos.deployment_target = '11.0'

  s.subspec 'FirebaseFirestoreInternalWrapper' do |ffiw|
    ffiw.dependency 'FirebaseFirestoreInternal-Invertase/FirebaseFirestoreInternal'
  end

  s.subspec 'FirebaseFirestoreInternal' do |ffi|
    ffi.vendored_frameworks = 'FirebaseFirestore/FirebaseFirestoreInternal.xcframework'
  end

end
