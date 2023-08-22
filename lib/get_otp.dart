import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medic/Login_Page.dart';
class Get_Otp extends StatefulWidget {
  const Get_Otp({super.key});

  @override
  State<Get_Otp> createState() => _Get_OtpState();
}

class _Get_OtpState extends State<Get_Otp> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: h*0.1),
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
            SizedBox(height: h * 0.03,),
            Container(
              child: Column(
                children: [
                  Text(
                    "OTP",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: h * 0.01,),
                  Text(
                    "Enter your email below to get code",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: h * 0.05,),
                ],
              ),
            ),
            SizedBox(height: h * 0.1,),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.teal.withOpacity(0.1),
              filled: true,
              keyboardType: TextInputType.numberWithOptions(),
              onSubmit: (code){ print("OTP is => $code");},
            ),
            SizedBox(height: h * 0.05,),
            GestureDetector(
              onTap: () {
                Get.to(()=> LoginPage());
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
