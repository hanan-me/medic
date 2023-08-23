import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
          type: FileType.image,
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
                  "Docor Name",
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
                Center(
                  child: isLoading?CircularProgressIndicator():TextButton(onPressed: (){}, child: Text("Upload Tests")),
                ),
                if(pickedfile != null)
                  SizedBox(child: Image.file(fileToDisplay!))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
