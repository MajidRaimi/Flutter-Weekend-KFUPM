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
    apiKey: 'AIzaSyDwqxtewR5SGABq4H-KfnvC-1F2LU2bdqg',
    appId: '1:411646791253:web:e4678ac6cd8ec9c7accedc',
    messagingSenderId: '411646791253',
    projectId: 'flutter-weekend-kfupm',
    authDomain: 'flutter-weekend-kfupm.firebaseapp.com',
    storageBucket: 'flutter-weekend-kfupm.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDyJs43PVXMwxiaUGcsWMxo1-22ksfL5EE',
    appId: '1:411646791253:android:23d882103fe303ccaccedc',
    messagingSenderId: '411646791253',
    projectId: 'flutter-weekend-kfupm',
    storageBucket: 'flutter-weekend-kfupm.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0oQsOICCIKDtv_mKV5eMxTiQKIuVM7kc',
    appId: '1:411646791253:ios:14a47f30a9821ac6accedc',
    messagingSenderId: '411646791253',
    projectId: 'flutter-weekend-kfupm',
    storageBucket: 'flutter-weekend-kfupm.appspot.com',
    iosClientId: '411646791253-e83mj2emkomt6pln9o3m6piqsnj56p0n.apps.googleusercontent.com',
    iosBundleId: 'com.example.iauFlutterWeekend',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC0oQsOICCIKDtv_mKV5eMxTiQKIuVM7kc',
    appId: '1:411646791253:ios:14a47f30a9821ac6accedc',
    messagingSenderId: '411646791253',
    projectId: 'flutter-weekend-kfupm',
    storageBucket: 'flutter-weekend-kfupm.appspot.com',
    iosClientId: '411646791253-e83mj2emkomt6pln9o3m6piqsnj56p0n.apps.googleusercontent.com',
    iosBundleId: 'com.example.iauFlutterWeekend',
  );
}
