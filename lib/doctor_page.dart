import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Login_Page.dart';
class Doctor_Page extends StatefulWidget {
  const Doctor_Page({super.key});

  @override
  State<Doctor_Page> createState() => _Doctor_PageState();
}

class _Doctor_PageState extends State<Doctor_Page> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed:()=> Get.back(),icon: const Icon(Icons.arrow_back, color: Colors.white)),
        title: Text("Profile"),
        actions: [IconButton(onPressed:()=> Get.to(()=> LoginPage()),icon: const Icon(Icons.logout_outlined, color: Colors.white))],
      ),
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: w,
              height: h*0.34,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "img/pexels-tima-miroshnichenko-5407206.jpg"
                      ),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          SizedBox(height: h*0.028,),
          Container(
            margin: const EdgeInsets.only(left: 25,top: 10,bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Doctor Name",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Specialization"
                )
              ],
            ),
          ),
          Divider(
            color: Colors.black54,
          ),
          Container(
            margin: const EdgeInsets.only(left: 25,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
