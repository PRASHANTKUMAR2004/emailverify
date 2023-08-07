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
    apiKey: 'AIzaSyBX-XIBVKyK3h-r8yyiT3XCHJnfQp8xU7s',
    appId: '1:202852114951:web:6a94944be2dc45ea6a00a2',
    messagingSenderId: '202852114951',
    projectId: 'loginexample-fe288',
    authDomain: 'loginexample-fe288.firebaseapp.com',
    storageBucket: 'loginexample-fe288.appspot.com',
    measurementId: 'G-TD956H0C9K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBo7S0CDKC8Ijp8lUL6OMU8fyLEfVEM7Rk',
    appId: '1:202852114951:android:93dff80f13669ae66a00a2',
    messagingSenderId: '202852114951',
    projectId: 'loginexample-fe288',
    storageBucket: 'loginexample-fe288.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzJhKTbStjvVZplPyrbICIRwBb_w2g54I',
    appId: '1:202852114951:ios:efdf9092f4f2477d6a00a2',
    messagingSenderId: '202852114951',
    projectId: 'loginexample-fe288',
    storageBucket: 'loginexample-fe288.appspot.com',
    androidClientId: '202852114951-s35ipb0tu2u8554282501dddp76kras3.apps.googleusercontent.com',
    iosClientId: '202852114951-k04ia8bj3sbagpf1m4ip6shg60jtr5jh.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDzJhKTbStjvVZplPyrbICIRwBb_w2g54I',
    appId: '1:202852114951:ios:a827bccff6f7b54f6a00a2',
    messagingSenderId: '202852114951',
    projectId: 'loginexample-fe288',
    storageBucket: 'loginexample-fe288.appspot.com',
    androidClientId: '202852114951-s35ipb0tu2u8554282501dddp76kras3.apps.googleusercontent.com',
    iosClientId: '202852114951-bmo1kguhgvjsdned2pebokj8n3kanmg5.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebase.RunnerTests',
  );
}
