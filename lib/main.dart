import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medic/Login_Page.dart';
import 'package:get/get.dart';
import 'package:medic/SplashScreen.dart';
import 'package:medic/firebase_options.dart';


import 'auth_controller.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthController()));
  // await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: new LoginScreen(),
      home: CircularProgressIndicator(),
    );//MaterialApp
  }
}
