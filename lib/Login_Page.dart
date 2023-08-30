import 'dart:js';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medic/Signup_Page.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_controller.dart';
import 'doc_dash.dart';
import 'forget_password.dart';
import 'package:medic/doc_dash.dart';
import 'lab_scientist.dart';
import 'patient_dash.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  List dropDownListData = [
    {"title": "Doctor", "value": "1"},
    {"title": "Patient", "value": "2"},
    {"title": "Lab Scientist", "value": "3"},
    {"title": "Data Entry Operator", "value": "4"},
  ];
  String defaultValue = "";
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        
        children: [
          Container(

            width: w,
            height: h*0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "img/upper.jpg"
                ),
                fit: BoxFit.cover
              )
            ),
          ),
          Form(
            key: _formkey,
            child: Container(
              margin: EdgeInsets.only(left: 20, right:20, top: 10),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: w*0.07,),
                  Container(
                    height: h*0.07,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.4),
                          )
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            isDense: true,
                            value: defaultValue,
                            isExpanded: true,
                            menuMaxHeight: 350,
                            items: [
                              const DropdownMenuItem(
                                  child: Text(
                                    "Sign as",
                                  ),
                                  value: ""),
                              ...dropDownListData.map<DropdownMenuItem<String>>((data) {
                                return DropdownMenuItem(
                                    child: Text(data['title']), value: data['value']);
                              }).toList(),
                            ],
                            onChanged: (value) {
                              // print("selected Value $value");
                              setState(() {
                                defaultValue = value!;
                              });
                            }),
                      ),
                    ),
                  ),
                  SizedBox(height: w*0.04,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color:Colors.grey.withOpacity(0.4),
                        )
                      ]
                    ),
                    child: TextField(
                      controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Your Email",
                      prefixIcon: Icon(Icons.email, color:Colors.teal),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0
                        )
                      ),
                    ),
                  )
                  ),
                  SizedBox(height: w*0.04,),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color:Colors.grey.withOpacity(0.4),
                            )
                          ]
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.password, color:Colors.teal),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: w*0.04,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: (){
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            builder: (context)=>Container(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Make Selection",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                  "Select one of the option given below to reset your password."
                              ),
                              SizedBox(height: h*0.05,),
                              GestureDetector(
                                onTap: (){Navigator.pop(context);Get.to(()=> ForgetPassword());},
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.email_outlined, color: Colors.teal,size: 50,),
                                      SizedBox(width: h*0.01,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Email"),
                                          Text("Reset via Email Verfication."),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: h*0.01,),
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.mobile_friendly, color: Colors.teal,size: 50,),
                                      SizedBox(width: h*0.01,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Phone Number"),
                                          Text("Reset via OTP Verfication."),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ));
                      },
                      child: Text(
                        "Forget Password!",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: w*0.07,),
          GestureDetector(
            onTap: (){
              signIn(emailController.text, passwordController.text);
            },
            child: Container(
              width: w*0.35,
              height: h*0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage(
                        "img/btn.jpg"
                    ),
                    fit: BoxFit.cover,
                  )
              ),
              child: Center(
                child: Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              )
            ),
          ),
          SizedBox(height: w*0.01,),
          RichText(text: TextSpan(
            text: "Don\'t have an account?",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20
            ),
            children: [
              TextSpan(
              text: "Create",
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
              ),
                recognizer: TapGestureRecognizer()..onTap =()=> Get.to(()=>SignupPage())
              )
            ]
          )
          )
        ],
      ),
    );
  }
  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "Patient") {
          Navigator.pushReplacement(
            context as BuildContext,
            MaterialPageRoute(
              builder: (context) =>  Patient_Dashboard(),
            ),
          );
        }
        if (documentSnapshot.get('rool') == "Doctor") {
          Navigator.pushReplacement(
            context as BuildContext,
            MaterialPageRoute(
              builder: (context) =>  DoctorDashboard(),
            ),
          );
        }
        if (documentSnapshot.get('rool') == "Lab Scientist") {
          Navigator.pushReplacement(
            context as BuildContext,
            MaterialPageRoute(
              builder: (context) =>  Lab_Scientist(),
            ),
          );
        }else{
          Navigator.pushReplacement(
            context as BuildContext,
            MaterialPageRoute(
              builder: (context) =>  Lab_Scientist(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}
