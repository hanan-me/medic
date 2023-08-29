import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medic/Login_Page.dart';
import 'package:medic/Profile_Page.dart';
import 'package:medic/Signup_Page.dart';
import 'package:medic/SplashScreen.dart';
import 'package:medic/data_entry.dart';
import 'package:medic/doc_dash.dart';
import 'package:medic/doc_home.dart';
import 'package:medic/doctor_page.dart';
import 'package:medic/doctor_profile.dart';
import 'package:medic/generate_prescription.dart';
import 'package:medic/getStarted.dart';
import 'package:medic/get_otp.dart';
import 'package:medic/lab_scientist.dart';
import 'package:medic/patient_dash.dart';

class AuthController extends GetxController{
  //AuthController.instance..
  static AuthController instance = Get.find();
  //email, password, name ....
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());// to track user
    ever(_user, _initialScreens);
  }
  _initialScreens(User? user){
    if(user == null){
      print("Signup page");
      Get.offAll(()=>SplashScreen());
    }else{
      Get.offAll(()=>LoginPage());
    }
  }

  void register(String email, String password,String role) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password)
      .then((value) => {postDetailsToFirestore(email, role)});
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
          "Invalid Email or Password!",
        )
      );
    }
  }
  postDetailsToFirestore(String email, String role) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = auth.currentUser;
    CollectionReference ref = firebaseFirestore.collection('Users');
    ref.doc(user!.uid).set({'email': email, 'role': role});
  }
  void logIn(String email, String password, String value) async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      // Get.offAll(()=>DoctorDashboard());
      if(value == "1"){
        Get.offAll(()=>DoctorDashboard());
      }else{
        if(value == "2"){
          Get.offAll(()=>Patient_Dashboard());
        }
        else{
          if(value == "3"){
            Get.offAll(()=>Lab_Scientist());
          }
          else{
            if(value == "4"){
              Get.offAll(()=>DataEntryOp());
            }
            else{
              Get.offAll(()=>LoginPage());
            }
          }
        }
      }
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
          "Empty Fields",
        )
      );
    }
  }
  void logOut() async{
    await auth.signOut();
  }
}