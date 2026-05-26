// Cấu hình Firebase — thay bằng file do FlutterFire CLI tạo:
//   dart pub global activate flutterfire_cli
//   flutterfire configure
//
// Hoặc lấy giá trị từ Firebase Console > Project settings > Your apps > Android
// và đặt google-services.json vào android/app/

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError('Web chưa được cấu hình Firebase.');
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'Firebase chưa cấu hình cho $defaultTargetPlatform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8wCz_MpG_i-Djl1FhjxG0byE17pAXOVA',
    appId: '1:659347423459:android:84dced677bec776e1b45d6',
    messagingSenderId: '659347423459',
    projectId: 'lab1-mobile-n2',
    storageBucket: 'lab1-mobile-n2.firebasestorage.app',
  );

  // TODO: Thay các giá trị YOUR_* sau khi tạo project Firebase

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'YOUR_IOS_API_KEY',
    appId: 'YOUR_IOS_APP_ID',
    messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
    projectId: 'YOUR_PROJECT_ID',
    storageBucket: 'YOUR_PROJECT_ID.appspot.com',
    iosBundleId: 'com.example.lab1MobileN2',
  );
}