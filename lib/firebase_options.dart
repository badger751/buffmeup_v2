// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCCKXAQr6KQbR4EOGrMXwwVhFuSbRnoHic',
    appId: '1:685944572354:web:e8906d8747c0356a406e5b',
    messagingSenderId: '685944572354',
    projectId: 'buffmeupv2',
    authDomain: 'buffmeupv2.firebaseapp.com',
    storageBucket: 'buffmeupv2.firebasestorage.app',
    measurementId: 'G-KLG1G0614C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCD9TLL-5uvL3sJ-bRIxQRJ7WBYZ_dkM70',
    appId: '1:685944572354:android:c4456517fc3eebb8406e5b',
    messagingSenderId: '685944572354',
    projectId: 'buffmeupv2',
    storageBucket: 'buffmeupv2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXiv3JSkXIgQ9g9kqODPEaT3qJfIDSfME',
    appId: '1:685944572354:ios:c0d21c5a3e7f538b406e5b',
    messagingSenderId: '685944572354',
    projectId: 'buffmeupv2',
    storageBucket: 'buffmeupv2.firebasestorage.app',
    iosBundleId: 'com.example.buffmeupV2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXiv3JSkXIgQ9g9kqODPEaT3qJfIDSfME',
    appId: '1:685944572354:ios:c0d21c5a3e7f538b406e5b',
    messagingSenderId: '685944572354',
    projectId: 'buffmeupv2',
    storageBucket: 'buffmeupv2.firebasestorage.app',
    iosBundleId: 'com.example.buffmeupV2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCCKXAQr6KQbR4EOGrMXwwVhFuSbRnoHic',
    appId: '1:685944572354:web:fe6d0d3c14c686ca406e5b',
    messagingSenderId: '685944572354',
    projectId: 'buffmeupv2',
    authDomain: 'buffmeupv2.firebaseapp.com',
    storageBucket: 'buffmeupv2.firebasestorage.app',
    measurementId: 'G-ZC5BWSDNJR',
  );
}
