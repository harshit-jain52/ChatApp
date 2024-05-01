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
    apiKey: 'AIzaSyBu046TpSPPw6nLnnBKg9TBwMm_IqNVr8w',
    appId: '1:803101028836:web:95f52266b191d3fd8357f1',
    messagingSenderId: '803101028836',
    projectId: 'chatapp-de8e2',
    authDomain: 'chatapp-de8e2.firebaseapp.com',
    storageBucket: 'chatapp-de8e2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCV-NdlS2C4whTNB1w-w0OdF_nR0Et4ouA',
    appId: '1:803101028836:android:acf4c221132c205e8357f1',
    messagingSenderId: '803101028836',
    projectId: 'chatapp-de8e2',
    storageBucket: 'chatapp-de8e2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPzi_qMtz7u73UxPRBmLbvOqq2_LCxRUM',
    appId: '1:803101028836:ios:42b9c296645c453d8357f1',
    messagingSenderId: '803101028836',
    projectId: 'chatapp-de8e2',
    storageBucket: 'chatapp-de8e2.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDPzi_qMtz7u73UxPRBmLbvOqq2_LCxRUM',
    appId: '1:803101028836:ios:42b9c296645c453d8357f1',
    messagingSenderId: '803101028836',
    projectId: 'chatapp-de8e2',
    storageBucket: 'chatapp-de8e2.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBu046TpSPPw6nLnnBKg9TBwMm_IqNVr8w',
    appId: '1:803101028836:web:f79bdbba3e00d6af8357f1',
    messagingSenderId: '803101028836',
    projectId: 'chatapp-de8e2',
    authDomain: 'chatapp-de8e2.firebaseapp.com',
    storageBucket: 'chatapp-de8e2.appspot.com',
  );

}