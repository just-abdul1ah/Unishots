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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDcE526wqQD_TppkQ644VVlIcTk5b1h1s8',
    appId: '1:333806950832:web:694fb4cc16c442dce71e75',
    messagingSenderId: '333806950832',
    projectId: 'instagram-clone-54902',
    authDomain: 'instagram-clone-54902.firebaseapp.com',
    storageBucket: 'instagram-clone-54902.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_vAaAxqsu7WTu85Tj5YLmW_QzeNQQIyI',
    appId: '1:333806950832:android:971191e2bd65681ce71e75',
    messagingSenderId: '333806950832',
    projectId: 'instagram-clone-54902',
    storageBucket: 'instagram-clone-54902.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDg1jk1HmBU03yPYn6U3KlU12oEcNJxplk',
    appId: '1:333806950832:ios:e82e5bae2e882613e71e75',
    messagingSenderId: '333806950832',
    projectId: 'instagram-clone-54902',
    storageBucket: 'instagram-clone-54902.appspot.com',
    iosBundleId: 'com.example.instagramClone',
  );
}
