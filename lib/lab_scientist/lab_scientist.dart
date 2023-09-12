import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medic/Accounts/Signup_Page.dart';

import '../Accounts/Login_Page.dart';
import '../Auths/auth_controller.dart';
class Lab_Scientist extends StatefulWidget {
  const Lab_Scientist({super.key});

  @override
  State<Lab_Scientist> createState() => _Lab_ScientistState();
}

class _Lab_ScientistState extends State<Lab_Scientist> {
  bool upload = false;
  double progress = 0.0;
  String urlDownload = "";
  UploadTask? uploadTask;
  DateTime dateTime = DateTime.now();
  PlatformFile? pickedFile;
  List<PlatformFile>? _files;
  final type = TextEditingController();
  Future selectFile() async{
    final result = await FilePicker.platform.pickFiles();
    if(result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }
  Future uploadFile() async{
    final path = 'Lab_Tests/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    print('Reference :  ${ref.fullPath}');
    uploadTask = ref.putFile(file);
    uploadTask!.snapshotEvents.listen((TaskSnapshot snapshot) {
      setState(() {
        progress = snapshot.bytesTransferred / snapshot.totalBytes;
      });
    });
    upload = true;
    final snapshot = await uploadTask!.whenComplete(() {});
    urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link: $urlDownload');
    setState(() {
      uploadTask = null;
      pickedFile = null;
      upload = false;
    });

    AuthController.instance.addLabTestDes(type.text, urlDownload,dateTime);
  }
  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed:()=> Get.back(),icon: const Icon(Icons.arrow_back, color: Colors.white)),
        title: Text("Lab Scientist"),
        actions: [IconButton(onPressed:(){AuthController.instance.logOut();},
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
                  controller: type,
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
                      child: ElevatedButton(
                        onPressed: selectFile,
                        child: Text('Pick a File'),
                      ),
                    ),
                  ),
                  if(pickedFile != null)
                    Center(child: Text("File name: ${pickedFile!.name}")),
                    if(pickedFile != null)
                      Center(
                        child :ElevatedButton(
                          onPressed: uploadFile,
                          child: Text('Upload File'),
                        ),
                      ),
                  if (upload) SizedBox(
                    height: 40,
                    child: Stack(
                      fit:StackFit.expand,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: Colors.grey,
                            color: Colors.green,
                          ),
                        ),
                        Center(
                          child: Text(
                            '${(100 * progress).roundToDouble()}%',
                            style: TextStyle(color:Colors.white),
                          ),
                        )
                      ],
                    ),
                  )
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
