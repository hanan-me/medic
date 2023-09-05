import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medic/Accounts/Signup_Page.dart';

import '../Accounts/Login_Page.dart';
class Lab_Scientist extends StatefulWidget {
  const Lab_Scientist({super.key});

  @override
  State<Lab_Scientist> createState() => _Lab_ScientistState();
}

class _Lab_ScientistState extends State<Lab_Scientist> {
  @override
  Widget build(BuildContext context) {
    FilePickerResult? result;
    String? _fileName;
    PlatformFile?pickedfile;
    bool isLoading = false;
    File?fileToDisplay;

    void pickFile() async{
      try{
        setState(() {
          isLoading = true;
        });
        result = await FilePicker.platform.pickFiles(
          type: FileType.any,
          allowMultiple: false,
        );
        if(result != null){
          _fileName = result!.files.first.name;
          pickedfile = result!.files.first;
          fileToDisplay = File(pickedfile!.path.toString());
          print("File Name $_fileName");
        }
        setState(() {
          isLoading = false;
        });

      }catch(e){
        print(e);
      }
    };

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed:()=> Get.back(),icon: const Icon(Icons.arrow_back, color: Colors.white)),
        title: Text("Lab Scientist"),
        actions: [IconButton(onPressed:()=> Get.to(()=> LoginPage()),
            icon: const Icon(Icons.logout_outlined, color: Colors.white))],
      ),
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: w*0.9,
                height: h*0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "img/3d-casual-life-boy-scientist.png"
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
                    "Lab Scientist Name",
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
              color: Colors.grey,
            ),
            // TextFieldWidget(hintText: "Report Name",icon: Icons.text_fields, validator: (value) {  },),
            Container(
                margin: EdgeInsets.only(left: 20, right:20, top: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(1, 1),
                        color:Colors.grey.withOpacity(0.4),
                      )
                    ]
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Report Name",
                    prefixIcon: Icon(Icons.text_fields, color:Colors.teal),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0
                        )
                    ),
                  ),
                )
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h*0.05,),

                  Center(
                    child: Container(
                      width: w*0.45,
                      height: h*0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 4,
                              offset: Offset(1, 1),
                              color:Colors.grey.withOpacity(0.5),
                            )
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.teal,
                              Colors.teal,
                            ],
                          )
                      ),
                      child: isLoading?CircularProgressIndicator():TextButton(onPressed: (){pickFile();}, child: Text("Upload Tests",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      )),
                    ),
                  ),
                  if(pickedfile != null)
                    SizedBox(child: Image.file(fileToDisplay!))
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
          ],
        ),
      ),
    );
  }
}
