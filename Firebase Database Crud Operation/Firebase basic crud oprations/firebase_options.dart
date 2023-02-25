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
    apiKey: 'AIzaSyCP6hSIyJmpPM_-jT76a7QMp_MnNIGMTfk',
    appId: '1:427461196211:web:492c8f77b069e0ca4533c6',
    messagingSenderId: '427461196211',
    projectId: 'firstfireapp-43ead',
    authDomain: 'firstfireapp-43ead.firebaseapp.com',
    storageBucket: 'firstfireapp-43ead.appspot.com',
    measurementId: 'G-VWJ8EPPTN9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKyd8i1XcQUjHoghdXnotuxcWJhQq6tj4',
    appId: '1:427461196211:android:76c4aac44fce919b4533c6',
    messagingSenderId: '427461196211',
    projectId: 'firstfireapp-43ead',
    storageBucket: 'firstfireapp-43ead.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPyyn3XUqpEdKblmoLTebvTdS1UYPHZ2o',
    appId: '1:427461196211:ios:b83130637c6aa0324533c6',
    messagingSenderId: '427461196211',
    projectId: 'firstfireapp-43ead',
    storageBucket: 'firstfireapp-43ead.appspot.com',
    iosClientId: '427461196211-6u1ufhuopjtfqku2d72vvgfs40dplsil.apps.googleusercontent.com',
    iosBundleId: 'com.example.app1Crud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPyyn3XUqpEdKblmoLTebvTdS1UYPHZ2o',
    appId: '1:427461196211:ios:b83130637c6aa0324533c6',
    messagingSenderId: '427461196211',
    projectId: 'firstfireapp-43ead',
    storageBucket: 'firstfireapp-43ead.appspot.com',
    iosClientId: '427461196211-6u1ufhuopjtfqku2d72vvgfs40dplsil.apps.googleusercontent.com',
    iosBundleId: 'com.example.app1Crud',
  );
}