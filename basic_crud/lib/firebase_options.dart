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
///
///
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
    apiKey: 'AIzaSyBXb4XKywXegHR3g428ManmwH-29coWXuk',
    appId: '1:696799057792:web:c7c39ea6f7168b11a59365',
    messagingSenderId: '696799057792',
    projectId: 'crudbookflutter',
    authDomain: 'crudbookflutter.firebaseapp.com',
    storageBucket: 'crudbookflutter.appspot.com',
    measurementId: 'G-0348SW7D2S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyDUiSPGhs1NzCSLT6JkG0pMTSXOGJuGE',
    appId: '1:696799057792:android:638a4fa113ce253da59365',
    messagingSenderId: '696799057792',
    projectId: 'crudbookflutter',
    storageBucket: 'crudbookflutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3UvBmVMlB0iUnmqoNStk-mNZN_-joK64',
    appId: '1:696799057792:ios:0a8b1dbbae5d8846a59365',
    messagingSenderId: '696799057792',
    projectId: 'crudbookflutter',
    storageBucket: 'crudbookflutter.appspot.com',
    iosClientId:
        '696799057792-f5qge0gp68q4f00rbgp1lnlh60lh9gfo.apps.googleusercontent.com',
    iosBundleId: 'com.example.basicCrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3UvBmVMlB0iUnmqoNStk-mNZN_-joK64',
    appId: '1:696799057792:ios:0a8b1dbbae5d8846a59365',
    messagingSenderId: '696799057792',
    projectId: 'crudbookflutter',
    storageBucket: 'crudbookflutter.appspot.com',
    iosClientId:
        '696799057792-f5qge0gp68q4f00rbgp1lnlh60lh9gfo.apps.googleusercontent.com',
    iosBundleId: 'com.example.basicCrud',
  );
}
