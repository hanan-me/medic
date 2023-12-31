import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medic/Accounts/Signup_Page.dart';
import 'package:get/get.dart';
import 'package:medic/Accounts/phone_verification.dart';
import 'package:medic/Doctor/doc_dash.dart';
import '../Auths/auth_controller.dart';
import 'forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
            Padding(
              padding: EdgeInsets.only(left:w*0.05,right: w*0.05),
              child: SingleChildScrollView(
                reverse: true,
                physics: BouncingScrollPhysics(),
                child: Column(
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
                    SizedBox(height: w*0.04,),
                    TextFieldWidget(hintText: "Your Email",
                      icon: Icons.email,
                      controler: emailController,
                      validator: (value) {
                        if (value!.length == 0) {
                          return "Email cannot be empty";
                        }
                        if (!RegExp(
                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please enter a valid email");
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: w*0.04,),
                    TextFieldWidget(hintText: "Password",icon: Icons.password_rounded,
                      controler: passwordController,
                      bol: true,
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        }
                        if (!regex.hasMatch(value)) {
                          return ("please enter valid password min. 6 character");
                        } else {
                          return null;
                        }
                      },
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
                                  onTap: (){
                                    Navigator.pop(context);Get.to(()=> Phone_Verfication());
                                  },
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
                    ),
                    SizedBox(height: w*0.07,),
                    GestureDetector(
                      onTap: (){
                        AuthController.instance.logIn(emailController.text.trim(),
                            passwordController.text.trim());
                      },
                      child: Container(
                          width: w*0.35,
                          height: h*0.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
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
                                fontSize: 20,
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
                    )),
                    // RoundedBtnWidget(title: "Logout",onPress: (){AuthController.instance.logOut();},),
                    Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
