// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD1V5J2aLkfMvCIQtgRPjY9Khihl-LtNzk',
    appId: '1:548013927414:web:4d524c8c964b422cb5b5d7',
    messagingSenderId: '548013927414',
    projectId: 'test-app-fcm-e0f06',
    authDomain: 'test-app-fcm-e0f06.firebaseapp.com',
    storageBucket: 'test-app-fcm-e0f06.appspot.com',
    measurementId: 'G-ZNNS5CD59Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWaUh9eYxiFeR1k7XVrY_W6Ps5zk6dv30',
    appId: '1:548013927414:android:14ba5d853405a665b5b5d7',
    messagingSenderId: '548013927414',
    projectId: 'test-app-fcm-e0f06',
    storageBucket: 'test-app-fcm-e0f06.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBF1_wInA_PtamYISJTOZ1mvVANajtx1Kk',
    appId: '1:548013927414:ios:fe183b9ebb2db833b5b5d7',
    messagingSenderId: '548013927414',
    projectId: 'test-app-fcm-e0f06',
    storageBucket: 'test-app-fcm-e0f06.appspot.com',
    iosClientId: '548013927414-dhhvtcdl7tadjsrp98530ralu9ia36g8.apps.googleusercontent.com',
    iosBundleId: 'com.example.testapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBF1_wInA_PtamYISJTOZ1mvVANajtx1Kk',
    appId: '1:548013927414:ios:0464f7ad02ef2116b5b5d7',
    messagingSenderId: '548013927414',
    projectId: 'test-app-fcm-e0f06',
    storageBucket: 'test-app-fcm-e0f06.appspot.com',
    iosClientId: '548013927414-jen03o0bcmt7lf689e5h1lg6m6bo2ar4.apps.googleusercontent.com',
    iosBundleId: 'com.example.testapp.RunnerTests',
  );
}