import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medic/Doctor/generate_report.dart';

import '../Accounts/Signup_Page.dart';
import '../Auths/auth_controller.dart';
import 'doc_dash.dart';
class CheckPatient extends StatefulWidget {
  const CheckPatient({super.key});

  @override
  State<CheckPatient> createState() => _CheckPatientState();
}

class _CheckPatientState extends State<CheckPatient> {
  final cnicController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String patientName = "";
  String phoneNumber = "";
  String role = "";
  String email = "";
  String cnic = "";

  bool check = false;
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
      body: SingleChildScrollView(
        reverse: true,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: h*0.08,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Search Patient By CNIC",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: h*0.08,left: h*0.03,right: h*0.03,bottom: h*0.04),
                child: TextFieldWidget(hintText: "Enter Patient CNIC..",
                    type: TextInputType.phone,
                    formKey: _formKey,
                    icon: Icons.numbers,
                    controler: cnicController,
                    validator: (value){
                      if (value != null) {
                        return null;
                      }else{
                        return "Empty fields!";
                      }
                    })
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
                        print("Empty fields");
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
                      RoundedBtnWidget(title: "History",onPress: (){}),
                      SizedBox(width: h*0.01,),
                      RoundedBtnWidget(title: "Generate Report",onPress: (){Get.to(()=>GenerateReport());}),
                    ],
                  )
                ],
              ),
            Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
          ],
        ),
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
