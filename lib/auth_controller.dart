import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medic/Login_Page.dart';
import 'package:medic/Profile_Page.dart';
import 'package:medic/Signup_Page.dart';
import 'package:medic/SplashScreen.dart';
import 'package:medic/doc_dash.dart';
import 'package:medic/doctor_page.dart';
import 'package:medic/doctor_profile.dart';
import 'package:medic/getStarted.dart';

class AuthController extends GetxController{
  //AuthController.instance..
  static AuthController instance = Get.find();
  //email, password, name ....
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    // super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());// to track user
    ever(_user, _initialScreens);
  }
  _initialScreens(User? user){
    if(user == null){
      print("Signup page");
      Get.offAll(()=>SplashScreen());
    }else{
      Get.offAll(()=>DoctorDashboard());
    }
  }

  void register(String email, String password) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      Get.snackbar("About User", "message",
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Account creation failed",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        messageText: Text(
          e.toString(),
        )
      );
    }
  }
  void logIn(String email, String password) async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      Get.snackbar("About Login", "message",
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Login failed",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        messageText: Text(
          e.toString(),
        )
      );
    }
  }
  void logOut() async{
    await auth.signOut();
  }
}