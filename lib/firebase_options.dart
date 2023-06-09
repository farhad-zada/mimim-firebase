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
    apiKey: 'AIzaSyC4LxuK6gulsnCD8XxQ3ipzAg77ybLM3As',
    appId: '1:430746963295:web:2986310900d9ee1708baea',
    messagingSenderId: '430746963295',
    projectId: 'f-mimim',
    authDomain: 'f-mimim.firebaseapp.com',
    storageBucket: 'f-mimim.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSnWYG7WpD3EsM-QwLutSDvOQKK_U8LE4',
    appId: '1:430746963295:android:122039c05767001708baea',
    messagingSenderId: '430746963295',
    projectId: 'f-mimim',
    storageBucket: 'f-mimim.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCi-7j8iCpOKuwbJi01dodaaNK4ZrHiIV8',
    appId: '1:430746963295:ios:ab3774cfea3e47db08baea',
    messagingSenderId: '430746963295',
    projectId: 'f-mimim',
    storageBucket: 'f-mimim.appspot.com',
    iosClientId: '430746963295-5l7qp4lfietbnequhvued3j4konr8pl9.apps.googleusercontent.com',
    iosBundleId: 'com.mimim.demo.mimim',
  );
}
