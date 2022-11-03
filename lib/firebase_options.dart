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
    apiKey: 'AIzaSyDJgmcR5L9sfGO04yK_j4UnkSKyggIYLPs',
    appId: '1:385039773809:web:22713d5b1422bce0a3abd0',
    messagingSenderId: '385039773809',
    projectId: 'asifintershiptex',
    authDomain: 'asifintershiptex.firebaseapp.com',
    storageBucket: 'asifintershiptex.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5hIKdJ1EuX5Ox-8_6fXJjtFngD9B9beM',
    appId: '1:385039773809:android:c4ae143ff9c8be86a3abd0',
    messagingSenderId: '385039773809',
    projectId: 'asifintershiptex',
    storageBucket: 'asifintershiptex.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBOsXlw157V75c8c24cW_sCpZRjMCu4cTY',
    appId: '1:385039773809:ios:b2e31665c8a02e59a3abd0',
    messagingSenderId: '385039773809',
    projectId: 'asifintershiptex',
    storageBucket: 'asifintershiptex.appspot.com',
    iosClientId: '385039773809-aok8sb3go5sp5be6qntu1bsks398v5qs.apps.googleusercontent.com',
    iosBundleId: 'com.example.firstweek',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBOsXlw157V75c8c24cW_sCpZRjMCu4cTY',
    appId: '1:385039773809:ios:b2e31665c8a02e59a3abd0',
    messagingSenderId: '385039773809',
    projectId: 'asifintershiptex',
    storageBucket: 'asifintershiptex.appspot.com',
    iosClientId: '385039773809-aok8sb3go5sp5be6qntu1bsks398v5qs.apps.googleusercontent.com',
    iosBundleId: 'com.example.firstweek',
  );
}
