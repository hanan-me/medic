import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medic/Doctor/generate_report.dart';
import 'package:medic/lab_scientist/lab_scientist.dart';

import '../Accounts/Signup_Page.dart';
import '../Auths/auth_controller.dart';
import '../Doctor/doc_dash.dart';

class LabCheckPatient extends StatefulWidget {
  const LabCheckPatient({super.key});

  @override
  State<LabCheckPatient> createState() => _LabCheckPatientState();
}

class _LabCheckPatientState extends State<LabCheckPatient> {
  final cnicController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String patientName = "";
  String phoneNumber = "";
  String role = "";
  String email = "";
  String cnic = "";
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed:()=> Get.back(),icon: const Icon(Icons.arrow_back, color: Colors.white)),
        title: Text("Search Patient"),
        actions: [IconButton(onPressed:(){AuthController.instance.logOut();},icon: const Icon(Icons.logout_outlined, color: Colors.white))],
      ),
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: h*0.1,),
          Text("Search Patient By CNIC",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: h*0.08,left: h*0.03,right: h*0.03,bottom: h*0.04),
              child: Form(
                key: _formKey,
                child: TextFieldWidget(hintText: "Enter Patient CNIC..",
                    type: TextInputType.phone,
                    icon: Icons.numbers,
                    controler: cnicController,
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
              onPress: () async{
                if (_formKey.currentState!.validate()) {
                  String patientId =
                  await AuthController.instance.checkPatientId(cnicController.text);

                  if (patientId != null) {
                    // Assuming you have a reference to your Firestore collection
                    // where patient data is stored (e.g., 'patients')
                    DocumentSnapshot patientSnapshot = await FirebaseFirestore.instance
                        .collection('Users')
                        .doc(patientId)
                        .get();

                    if (patientSnapshot.exists) {
                      // Access the patient data
                      Map<String, dynamic> patientData =
                      patientSnapshot.data() as Map<String, dynamic>;
                      setState(() {
                        patientName = patientData['Name'];
                        phoneNumber = patientData['Phone Number'];
                        role = patientData['Role'];
                        email = patientData['Email'];
                        cnic = patientData['CNIC'];
                      });
                    } else {
                      Get.snackbar(
                        "Check",
                        "message",
                        backgroundColor: Colors.redAccent,
                        snackPosition: SnackPosition.BOTTOM,
                        titleText: Text(
                          "Invalid Cnic Number",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        messageText: Text(
                          "Patient Record not Found!",
                        ),
                      );
                    }
                  } else {
                    print("Patient ID is null.");
                  }
                } else {
                  print("Something went wrong!!");
                }
              }),
          SizedBox(height: h*0.04,),
          if (patientName.isNotEmpty)
            Column(
              children: [
                Container(
                  height: h*0.3,
                  width: w*0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.4),
                        )
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(title: 'Patient Name: ',attribute: '$patientName',),
                        TextWidget(title: 'Patient CNIC: ',attribute: '$cnic',),
                        TextWidget(title: 'Patient Email: ',attribute: '$email',),
                        TextWidget(title: 'Patient Phone Number: ',attribute: '$phoneNumber',),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: h*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedBtnWidget(title: "Create Report",onPress: (){Get.to(()=>Lab_Scientist());}),
                  ],
                )
              ],
            ),
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.attribute, required this.title,
  });

  final String attribute;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ),
        SizedBox(height: 50,),
        Text(attribute,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
