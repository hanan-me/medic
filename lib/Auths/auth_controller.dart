import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medic/Data%20Entry%20Operator/data_entry.dart';

import 'package:medic/Starter/SplashScreen.dart';

import 'package:medic/Doctor/doc_home.dart';
import 'package:medic/lab_scientist/lab_scientist.dart';

import '../Accounts/Login_Page.dart';
import '../Patient/patient_dash.dart';


class AuthController extends GetxController{
  //AuthController.instance..
  static AuthController instance = Get.find();
  //email, password, name ....
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

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
          e.toString(),
        )
      );
    }
  }
  postDetailsToFirestore(String email, String role) async {
    var user = auth.currentUser;
    CollectionReference ref = firebaseFirestore.collection('Users');
    ref.doc(user!.uid).set({'email': email, 'role': role});
    Get.offAll(()=>LoginPage());
  }
  void logIn(String email, String password) async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      route();
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
  void route() {
    var user = auth.currentUser;
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "Doctor") {
          Get.offAll(()=>Doctor_Home());
        }else{
          if (documentSnapshot.get('role') == "Patient") {
            Get.offAll(()=>Patient_Dashboard());
          }else{
            if (documentSnapshot.get('role') == "Lab Scientist") {
              Get.offAll(()=>Lab_Scientist());
            }else{
              if (documentSnapshot.get('role') == "Data Entry Operator") {
                Get.offAll(()=>DataEntryOp());
              }else{
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
                      "Somrthing went wrong!",
                    )
                );
              }
            }
          }
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }
  void logOut() async{
    await auth.signOut();
  }
}