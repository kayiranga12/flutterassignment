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
    apiKey: 'AIzaSyAnc1CsaXQAbMALNUc1eiEHX8KKZfXFfOg',
    appId: '1:455053830319:web:36f2b650d8140a67828c5a',
    messagingSenderId: '455053830319',
    projectId: 'navbarhomeaboutcalculatorapp',
    authDomain: 'navbarhomeaboutcalculatorapp.firebaseapp.com',
    databaseURL: 'https://navbarhomeaboutcalculatorapp-default-rtdb.firebaseio.com',
    storageBucket: 'navbarhomeaboutcalculatorapp.appspot.com',
    measurementId: 'G-TREYPF74LQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYlujzRyVpmQ3Oyc8sIcYgQL217v8QgR8',
    appId: '1:455053830319:android:bb7cd76e484347e8828c5a',
    messagingSenderId: '455053830319',
    projectId: 'navbarhomeaboutcalculatorapp',
    databaseURL: 'https://navbarhomeaboutcalculatorapp-default-rtdb.firebaseio.com',
    storageBucket: 'navbarhomeaboutcalculatorapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCl3H2EERzEdDN7C3lRJ4d5pnDuOZ7QmRA',
    appId: '1:455053830319:ios:2a001ab305fcc9a3828c5a',
    messagingSenderId: '455053830319',
    projectId: 'navbarhomeaboutcalculatorapp',
    databaseURL: 'https://navbarhomeaboutcalculatorapp-default-rtdb.firebaseio.com',
    storageBucket: 'navbarhomeaboutcalculatorapp.appspot.com',
    iosClientId: '455053830319-2dkjpb88m1l09rk8v95ns15t6l2ks6jj.apps.googleusercontent.com',
    iosBundleId: 'com.example.navbarhomeaboutcalculatorapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCl3H2EERzEdDN7C3lRJ4d5pnDuOZ7QmRA',
    appId: '1:455053830319:ios:868d9374f10887fb828c5a',
    messagingSenderId: '455053830319',
    projectId: 'navbarhomeaboutcalculatorapp',
    databaseURL: 'https://navbarhomeaboutcalculatorapp-default-rtdb.firebaseio.com',
    storageBucket: 'navbarhomeaboutcalculatorapp.appspot.com',
    iosClientId: '455053830319-t5k36hvundc55k1gqd45h5q1ajmd9pk8.apps.googleusercontent.com',
    iosBundleId: 'com.example.navbarhomeaboutcalculatorapp.RunnerTests',
  );
}
