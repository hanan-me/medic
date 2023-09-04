import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medic/Auths/auth_controller.dart';
import 'package:medic/Doctor/check_patient.dart';
import 'package:medic/Doctor/doc_dash.dart';
import 'package:medic/Doctor/generate_prescription.dart';
import 'package:medic/Doctor/generate_report.dart';

import '../Accounts/Login_Page.dart';

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
        actions: [IconButton(onPressed:(){AuthController.instance.logOut();},icon: const Icon(Icons.logout_outlined, color: Colors.white))],
      ),
      bottomNavigationBar: GNav(
        gap: 4,
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.teal,
        color: Colors.white54,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.white24,
        tabs: [
        GButton(icon: Icons.home,text: "Home",onPressed: (){},),
        GButton(icon: Icons.heart_broken,text: "Diagnose",onPressed: (){Get.to(()=>CheckPatient());},),
        GButton(icon: Icons.view_module,text: "Patient History",onPressed: (){},),
        GButton(icon: Icons.person,text: "Profile",onPressed: (){Get.to(()=>DoctorDashboard());},),
      ],),
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(height: h*0.02,),
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.only(left: h*0.03,right: h*0.03),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About",style: TextStyle(fontSize: 28,color: Colors.black87,fontWeight: FontWeight.bold),),
                  SizedBox(height: w*0.01,),
                  Text("A physician, medical practitioner, medical doctor, "
                      "or simply doctor, is a health professional who practices medicine, "
                      "which is concerned with promoting, maintaining or restoring health "
                      "through the study, diagnosis, ",
                    style: TextStyle(fontSize: 15,color: Colors.black54),),
                ],
              )
            ),
            SizedBox(height: w*0.2,),
            Center(
              child: Row(
                children:[
                  SizedBox(width: h*0.013,),
                  ButtonWidget(title: "Profile", onPress: () { Get.to(()=>GenerateReport()); },),
                  SizedBox(width: h*0.005,),
                  ButtonWidget(title: "Diagnose", onPress: () { Get.to(()=>CheckPatient()); },),
                  SizedBox(width: h*0.005,),
                  ButtonWidget(title: "Patient History", onPress: () {  },),
                ]
              ),
            ),
            SizedBox(height: w*0.02,),
          ],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.title, required this.onPress,
  });

  final title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPress,
      child: Container(
          width: w*0.31,
          height: h * 0.06,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
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
                color: Colors.white,
                fontSize: 12
              ),
              ),
            ),
            // SizedBox(height: h*0.01,),
            Icon(icon, color: Colors.white,size: 30,),
          ],
        )
      ),
    );
  }
}
