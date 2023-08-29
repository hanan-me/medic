import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medic/doc_dash.dart';
import 'package:medic/generate_prescription.dart';

import 'Login_Page.dart';
class Doctor_Home extends StatefulWidget {
  const Doctor_Home({super.key});

  @override
  State<Doctor_Home> createState() => _Doctor_HomeState();
}

class _Doctor_HomeState extends State<Doctor_Home> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed:()=> Get.back(),icon: const Icon(Icons.arrow_back, color: Colors.white)),
        title: Text("Profile"),
        // actions: [IconButton(onPressed:()=> Get.to(()=> LoginPage()),icon: const Icon(Icons.logout_outlined, color: Colors.white))],
      ),
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: w,
            height: h*0.34,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "img/240_F_136187711_qeBMOwkPdTg1dCN8e5TR1AmduXDz60Xn.jpg"
                    ),
                    fit: BoxFit.cover
                )
            ),
          ),
          SizedBox(height: h*0.028,),
          Padding(
            padding: EdgeInsets.only(left: h*0.03,),
            child: Text("Doctor Name..",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.teal),),
          ),
          SizedBox(height: h*0.01,),
          Padding(
            padding: EdgeInsets.only(left: h*0.03,),
            child: Text("Specialization",style: TextStyle(fontSize: 20,color: Colors.black54),),
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.only(left: h*0.03,right: h*0.03,top: h*0.04),
              crossAxisSpacing: 10,
              mainAxisSpacing: h*0.03,
              crossAxisCount: 3,
              children: [
                MenuBoxes(title: 'Relevant Investigation',icon: Icons.heart_broken, onPress: () {  },),
                MenuBoxes(title: 'Date of Surgery',icon: Icons.heart_broken, onPress: () {  },),
                MenuBoxes(title: 'Diagnosis',icon: Icons.heart_broken, onPress: () {  },),
                MenuBoxes(title: 'Operative Procedure',icon: Icons.heart_broken, onPress: () {  },),
                MenuBoxes(title: 'Instructions on Discharge',icon: Icons.heart_broken, onPress: () {  },),
                MenuBoxes(title: 'Medications on Discharge',icon: Icons.heart_broken, onPress: () { Get.to(Generate_Prescription()); },),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Get.to(DoctorDashboard());
            },
            child: Container(
                width: w,
                height: h * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.teal,
                        Colors.teal,
                      ],
                    )
                ),
                child: Center(
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}

class MenuBoxes extends StatelessWidget {
  const MenuBoxes({
    super.key,
     this.title, this.icon, required this.onPress,
  });

  final title;
  final icon;
  final VoidCallback onPress;


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(1, 1),
                color: Colors.grey.withOpacity(0.5),
              )
            ]
        ),
        // color: Colors.teal[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: h*0.03,left: h*0.01,right: h*0.01),
              child: Text(
                  title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white
              ),
              ),
            ),
            // SizedBox(height: h*0.01,),
            Icon(icon, color: Colors.white,size: 40,),
          ],
        )
      ),
    );
  }
}
