import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medic/Starter/SplashScreen.dart';


import 'Auths/auth_controller.dart';
import 'Starter/firebase_options.dart';

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
      debugShowCheckedModeBanner: false,
      home:
      SizedBox(
        height: 50,
        width: 50,
        child:CircularProgressIndicator(),
      ),
      theme: ThemeData(primarySwatch: Colors.teal),
    );//MaterialApp
  }
}
