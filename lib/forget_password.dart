import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'get_otp.dart';
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
            SizedBox(height: h * 0.1,),
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
                  Text(
                    "Forget Password",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Enter your email below to get code.",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: h * 0.05,),
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
                ],
              ),
            ),
            SizedBox(height: h * 0.03,),
            GestureDetector(
              onTap: () {
                Get.to(()=> Get_Otp());
              },
              child: Container(
                  width: w * 0.4,
                  height: h * 0.055,
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
                      "Next",
                      style: TextStyle(
                        fontSize: 22,
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
