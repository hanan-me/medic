import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Accounts/Signup_Page.dart';
import '../Auths/auth_controller.dart';
import 'doc_dash.dart';
class CheckPatient extends StatefulWidget {
  const CheckPatient({super.key});

  @override
  State<CheckPatient> createState() => _CheckPatientState();
}

class _CheckPatientState extends State<CheckPatient> {
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
        title: Text("Search Patient"),
        // actions: [IconButton(onPressed:()=> Get.to(()=> LoginPage()),icon: const Icon(Icons.logout_outlined, color: Colors.white))],
      ),
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: h*0.1,),
          Text("Search By Patient CNIC",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
          ),
          Padding(
              padding: EdgeInsets.only(top: h*0.08,left: h*0.03,right: h*0.03,bottom: h*0.04),
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
        ],
      ),
    );
  }
}
