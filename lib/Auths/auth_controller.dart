import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medic/Data%20Entry%20Operator/data_entry.dart';

import 'package:medic/Starter/SplashScreen.dart';

import 'package:medic/Doctor/doc_home.dart';
import 'package:medic/file_pick.dart';
import 'package:medic/lab_scientist/lab_check_p.dart';
import 'package:medic/lab_scientist/lab_scientist.dart';

import '../Accounts/Login_Page.dart';
import '../Patient/patient_dash.dart';


class AuthController extends GetxController{
  //AuthController.instance..
  static AuthController instance = Get.find();
  var id = "";
  String patientId="";
  List<String> pData = [];
  //email, password, name ....
  final _users = Rxn<User>();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  late Stream<User?> authStateChanges;
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

  void register(String name, String num, String cnic, String email, String password, String role, String g, String dob) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
        postDetailsToFirestore(name, num, cnic, email, role,g,dob);
      });
    } catch (e) {
      Get.snackbar(
        "About User",
        "message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Account creation failed",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
        ),
      );
    }
  }

  postDetailsToFirestore(String name, String num, String cnic, String email, String role, String g, String dob) async {
    var user = auth.currentUser;
    CollectionReference userRef = firebaseFirestore.collection('Users');

    try {
      // Create a document in the "Users" collection for the user
      await userRef.doc(user!.uid).set({
        'Role': role,
        'Email': email,
        'CNIC': cnic,
        'Phone Number': num,
        'Name': name,
        'Gender': g,
        'Date Of Birth': dob,
      });

      // Create a subcollection named "Reports" for the user
      CollectionReference reportsRef = userRef.doc(user.uid).collection('Reports');

      // Add a document to the "Reports" subcollection
      await reportsRef.add({
        'field1': 'value1',
        'field2': 'value2',
      });

      CollectionReference testsRef = userRef.doc(user.uid).collection('Tests');
      await testsRef.add({
        'field1': 'value1',
        'field2': 'value2',
      });

      Get.offAll(() => LoginPage());
    } catch (error) {
      Get.snackbar(
        "Error",
        "An error occurred while saving user data",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Error",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          error.toString(),
        ),
      );
    }
  }
  void logIn(String email, String password) async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      route();
      // getUserid();
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
  void route() {
    var user = auth.currentUser;
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('Role') == "Doctor") {
          Get.offAll(()=>Doctor_Home());
        }else{
          if (documentSnapshot.get('Role') == "Patient") {
            Get.offAll(()=>Patient_Dashboard());
          }else{
            if (documentSnapshot.get('Role') == "Lab Scientist") {
              Get.offAll(()=>LabCheckPatient());
            }else{
              if (documentSnapshot.get('Role') == "Data Entry Operator") {
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
                      "Something went wrong!",
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



  void generatePrescription(String med) async{
    try{
      var user = auth.currentUser;
      CollectionReference ref = firebaseFirestore.collection('Users');
      ref.doc(user!.uid).set({'Medicine': med});
      Get.offAll(()=>Doctor_Home());
    }
    catch(e){
      Get.snackbar("Prescription", "message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Failed to Prescribe!!",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
            "Something went wrong!!",
          )
      );
    }
  }

  Future<String> checkPatientId(String cnic) async {
    try {
      QuerySnapshot query = await FirebaseFirestore.instance
          .collection('Users')
          .where("CNIC", isEqualTo: cnic)
          .where("Role", isEqualTo: "Patient") // Add the "role" condition here
          .get();
      query.docs.forEach((element) {
        // print(element.data());
        patientId = element.id; // Store element.id as a string
        print(patientId);
      });
    } catch (e) {
      Get.snackbar(
        "Check",
        "message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Invalid Cnic Number",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
        ),
      );
    }
    return patientId;
  }

  void addLabTestDes (String type, String url, DateTime dateTime,double progress) async{
    var user = auth.currentUser;
    try{
      CollectionReference reportsRef = firebaseFirestore.collection('Users').doc(patientId).collection('Tests');
      // Add a document to the "Reports" subcollection
      await reportsRef.add({
        'lab Scientist Id': user!.uid,
        'Report Type': type,
        'Report Reference': url,
        'Date': dateTime,
      });
    }catch (error) {
      Get.snackbar(
        "Error",
        "An error occurred while saving user data",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Error",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          error.toString(),
        ),
      );
    }
  }
}