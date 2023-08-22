import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medic/Login_Page.dart';
import 'package:get/get.dart';
import 'package:medic/auth_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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

    List images = [
      "google.png",
      "facebook.png"
    ];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var _value = "-1";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Form(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 0),
              width: w * 0.3,
              height: h * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "img/logo up.png"
                      ),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "MEDIC",
                  //   style: TextStyle(
                  //     fontSize: 50,
                  //     color: Colors.teal,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  Text(
                    "Register your account",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: h * 0.02,),
                  Container(
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
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Your Name",
                          prefixIcon: Icon(Icons.person, color: Colors.teal),
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
                  SizedBox(height: h * 0.02,),
                  Container(
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
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          prefixIcon: Icon(Icons.numbers, color: Colors.teal),
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
                  SizedBox(height: h * 0.02,),
                  Container(
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
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        // hintText: "-Login as-",
                        prefixIcon: Icon(Icons.person, color: Colors.teal),
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
                      value: _value,
                      items: [
                        DropdownMenuItem(child: Text("-Signup as-"),
                          value: "-1",),
                        DropdownMenuItem(child: Text("Doctor"), value: "1",),
                        DropdownMenuItem(child: Text("Patient"), value: "2",),
                        DropdownMenuItem(child: Text("Lab Operator"),
                          value: "3",),
                        DropdownMenuItem(child: Text("Data Entry Operator"),
                          value: "4",),
                      ],
                      onChanged: (v) {},
                    ),
                  ),
                  SizedBox(height: h * 0.02,),
                  Container(
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
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Your Email",
                          prefixIcon: Icon(Icons.email, color: Colors.teal),
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
                  SizedBox(height: h * 0.02,),
                  Container(
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
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.password, color: Colors.teal),
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
                  SizedBox(height: h * 0.02,),
                ],
              ),
            ),
            SizedBox(height: h * 0.03,),
            GestureDetector(
              onTap: () {
                AuthController.instance.register(emailController.text.trim(),
                    passwordController.text.trim());
              },
              child: Container(
                  width: w * 0.4,
                  height: h * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage(
                            "img/btn.jpg"
                        ),
                        fit: BoxFit.cover,
                      )
                  ),
                  child: Center(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
              ),
            ),
            SizedBox(height: w * 0.01,),
            RichText(text: TextSpan(
                text: "Already have an account?",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Get.to(() => LoginPage())
            )),
            SizedBox(height: 20,),
            RichText(text: TextSpan(
              text: "Sign up using the following method",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16
              ),
            )),
            // SizedBox(height: w*0.01,),
            Expanded(
              child: Wrap(
                children: List<Widget>.generate(
                    2,
                        (index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                            backgroundImage: AssetImage(
                                "img/" + images[index]
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
