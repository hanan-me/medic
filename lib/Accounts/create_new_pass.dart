import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';


import 'Login_Page.dart';
import 'get_otp.dart';
class Create_Password extends StatefulWidget {
  const Create_Password({super.key});

  @override
  State<Create_Password> createState() => _Create_PasswordState();
}

class _Create_PasswordState extends State<Create_Password> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Form(
        child: Column(
          children: [
            SizedBox(height: h * 0.05,),
            Container(
              margin: const EdgeInsets.only(top: 0),
              child: Lottie.asset(
                'animations/ZP3Bh6OLRu.json',
                height: h * 0.3,
                repeat: true,
                reverse: true,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create New Password",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: h * 0.01,),
                  Text(
                    "Create your new password to login",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: h * 0.05,),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
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
                        // controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter New Password",
                          prefixIcon: Icon(Icons.password_rounded, color:Colors.teal),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
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
                          borderRadius: BorderRadius.circular(18),
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
                        // controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          prefixIcon: Icon(Icons.password, color:Colors.teal),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: h * 0.01,),
                ],
              ),
            ),
            SizedBox(height: h * 0.03,),
            GestureDetector(
              onTap: () {
                Get.to(()=> LoginPage());
              },
              child: Container(
                  width: w * 0.58,
                  height: h * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 4,
                          offset: Offset(1, 1),
                          color:Colors.grey.withOpacity(0.5),
                        )
                      ],
                      image: DecorationImage(
                        image: AssetImage(
                            "img/btn.jpg"
                        ),
                        fit: BoxFit.cover,
                      )
                  ),
                  child: Center(
                    child: Text(
                      "Create Password",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
