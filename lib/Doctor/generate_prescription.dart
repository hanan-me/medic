import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:medic/Accounts/Signup_Page.dart';
import 'package:medic/Doctor/doc_dash.dart';

import '../Auths/auth_controller.dart';
class Generate_Prescription extends StatefulWidget {
  const Generate_Prescription({super.key});

  @override
  State<Generate_Prescription> createState() => _Generate_PrescriptionState();
}

class _Generate_PrescriptionState extends State<Generate_Prescription> {
  List<TextEditingController> listController = [TextEditingController()];
  var count = 0;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed:()=> Get.back(),icon: const Icon(Icons.arrow_back, color: Colors.white)),
        title: Text("Prescription"),
        // actions: [IconButton(onPressed:()=> Get.to(()=> DoctorDashboard()),
        //     icon: const Icon(Icons.logout_outlined, color: Colors.white))],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: h*0.01,),
              Container(
                child: Lottie.asset(
                  'animations/aFwlh3S3cv.json',
                  height: h * 0.2,
                  repeat: true,
                  reverse: true,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "Generate Prescription",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.teal,
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: h*0.0,horizontal: h*0.015),
                shrinkWrap: true,
                itemCount: listController.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.only(top: h*0.02),
                    child: Row(
                      children: [
                        Expanded(child: TextFieldWidget(hintText: "Medication",
                          icon: Icons.medication,
                          controler: listController[index],validator: (value){})),
                        SizedBox(width: h*0.01,),
                        Expanded(child: TextFieldWidget(hintText: "Duration",icon: Icons.timelapse,
                            validator: (value){})),
                        if (index != 0) GestureDetector(
                                onTap: (){
                                  setState(() {
                                    listController[index].clear();
                                    listController[index].dispose();
                                    listController.removeAt(index);
                                  });
                                },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 35,
                              ),
                            ) else const SizedBox(),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: h*0.05,),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        count += 1;
                        setState(() {
                          listController.add(TextEditingController());
                        });
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: h*0.03,right: h*0.01),
                          width: w * 0.4,
                          height: h * 0.055,
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
                              "Add More",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print(listController[count].text);
                        AuthController.instance.generatePrescription(listController[0].text);
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: h*0.01,right: h*0.03),
                          width: w * 0.4,
                          height: h * 0.055,
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
                              "Prescribe",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Margin extends StatelessWidget {
  const Margin({
    super.key, required this.v, required this.h,
  });

  final double v;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: v,horizontal: h),
    );
  }
}