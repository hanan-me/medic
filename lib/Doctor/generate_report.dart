import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medic/Accounts/Signup_Page.dart';
import 'package:medic/Auths/auth_controller.dart';
import 'package:medic/Doctor/doc_dash.dart';

import 'doc_home.dart';
import 'generate_prescription.dart';
class GenerateReport extends StatefulWidget {
  const GenerateReport({super.key});

  @override
  State<GenerateReport> createState() => _GenerateReportState();
}

class _GenerateReportState extends State<GenerateReport> {
  final emailControler = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed:()=> Get.back(),icon: const Icon(Icons.arrow_back, color: Colors.white)),
        title: Text("Generate Report"),
        // actions: [IconButton(onPressed:()=> Get.to(()=> LoginPage()),icon: const Icon(Icons.logout_outlined, color: Colors.white))],
      ),
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: h*0.18,left: h*0.03,right: h*0.03,bottom: h*0.04),
              child: Form(
                key: _formkey,
                child: TextFieldWidget(hintText: "Enter Patient CNIC..",
                  type: TextInputType.phone,
                  icon: Icons.numbers,
                  controler: emailControler,
                    validator: (value){
                  if (value!.isEmpty) {
                      return "Cannot be empty";
                    }else{
                    return null;
                  }
                }),
              )
          ),
          RoundedBtnWidget( title: "Check",
              onPress: (){
            if(_formkey.currentState!.validate()){
              AuthController.instance.checkPatientId(emailControler.text);
            }else{
              print("Something went wrong!!");
            }
          }),
          SizedBox(height: h*0.04,),
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
        ],
      ),
    );
  }
}
