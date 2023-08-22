import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medic/Signup_Page.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

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
          Container(
            margin: const EdgeInsets.only(left: 20, right:20, top: 10),
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
                SizedBox(height: 50,),
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
                SizedBox(height: 20,),
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
                SizedBox(height: 5,),
                Row(
                  children: [
                    Expanded(child: Container(),),
                    Text(
                      "Forgot your Password?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.teal,
                      ),
                    ),
                  ]
                )
              ],
            ),
          ),
          SizedBox(height: w*0.1,),
          GestureDetector(
            onTap: (){
              AuthController.instance.logIn(emailController.text.trim(),
                  passwordController.text.trim());
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
}
