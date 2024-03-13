import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:navbarhomeaboutcalculatorapp/pages/home.dart';
import 'package:navbarhomeaboutcalculatorapp/pages/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
  ?await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAYlujzRyVpmQ3Oyc8sIcYgQL217v8QgR8',
       appId: '1:455053830319:android:bb7cd76e484347e8828c5a',
        messagingSenderId: '455053830319',
         projectId: 'navbarhomeaboutcalculatorapp'
         ))
         : await Firebase.initializeApp();
  
  //   await initFireBase(); // Wait for Firebase to initialize
  // InitialBinding().dependencies(); // Register dependencies using InitialBinding
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignment',
      // home: MyHomePage(title: 'Home Page'),
      home: const WelcomeScreen(),
      
    );
  }
}

// Future<void> initFireBase() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
// }

// void main(List<String> args) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initFireBase();
//   runApp(GetMaterialApp(
//     home: DataUploaderScreen(),
//   ));
// }