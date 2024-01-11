firebase_firestore_version = '10.17.0'

Pod::Spec.new do |s|
  s.name                   = 'FirebaseFirestore'
  s.version                = firebase_firestore_version
  s.summary                = 'A replica Firebase Firestore podspec.'
  s.description            = 'A replica Firebase Firestore podspec that provides pre-compiled binaries/frameworks instead'
  s.homepage               = 'http://invertase.io'
  s.license                = 'Apache-2.0'
  s.source                 = { :path => '.' }
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
  s.compiler_flags = '$(inherited) -Wreorder -Werror=reorder -Wno-comma'

  s.swift_version = '5.3'
  s.cocoapods_version = '>= 1.4.0'
  s.requires_arc            = true
  s.prefix_header_file = false
  s.public_header_files = 'FirebaseFirestoreInternal/**/*.h'


  frameworksBase = Dir.glob("FirebaseFirestore/*.xcframework").select do |name|
    if name.include?('FirebaseFirestoreInternal')
      true
    else
      false
    end
  end
  s.vendored_frameworks  = frameworksBase
  s.preserve_paths       = frameworksBase
  s.resource             = 'FirebaseFirestore/Resources/*.bundle'
  s.dependency 'FirebaseCore', firebase_firestore_version
  s.dependency 'FirebaseFirestore', firebase_firestore_version
  s.dependency 'FirebaseCoreExtension', firebase_firestore_version
  s.dependency 'FirebaseSharedSwift', firebase_firestore_version
end
