import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medic/Accounts/Signup_Page.dart';

import '../Accounts/Login_Page.dart';
class FilePickerr extends StatefulWidget {
  const FilePickerr({super.key});

  @override
  State<FilePickerr> createState() => _FilePickerrState();
}

class _FilePickerrState extends State<FilePickerr> {

  bool upload = false;
  double progress = 0.0;
  UploadTask? uploadTask;
  PlatformFile? pickedFile;
  List<PlatformFile>? _files;
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
    print(ref);
    uploadTask = ref.putFile(file);
    uploadTask!.snapshotEvents.listen((TaskSnapshot snapshot) {
      setState(() {
        progress = snapshot.bytesTransferred / snapshot.totalBytes;
      });
    });
    upload = true;
    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link: $urlDownload');
    setState(() {
      uploadTask = null;
    });
  }
  // Function to pick a file
  // Future<void> uploadFileToFirebaseStorage(File file) async {
  //   try {
  //     Reference storageReference = FirebaseStorage.instance.ref().child(
  //         'Lab_Tests/${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}');
  //
  //     UploadTask uploadTask = storageReference.putFile(file);
  //
  //     await uploadTask.whenComplete(() async {
  //       print('File uploaded to Firebase Storage');
  //       final downloadUrl = await storageReference.getDownloadURL();
  //       print('Download URL: $downloadUrl');
  //     });
  //   } catch (e) {
  //     print('Error uploading file: $e');
  //   }
  // }
  // void _pickAndUploadFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //
  //   if (result != null) {
  //     for (final file in result.files) {
  //       await uploadFileToFirebaseStorage(File(file.path!));
  //     }
  //     setState(() {
  //       _files = result.files;
  //     });
  //   } else {
  //     // User canceled the file picker
  //   }
  // }
  // void _pickFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //
  //   if (result != null) {
  //     setState(() {
  //       _filePath = result.files.single.path;
  //     });
  //   } else {
  //     // User canceled the file picker
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h*0.2,),
            Center(
              child :ElevatedButton(
                onPressed: selectFile,
                child: Text('Pick a File'),
              ),
            ),
            SizedBox(height: 20.0),
            // _files != null
            //     ? Column(
            //   children: _files!.map((file) {
            //     return Text('Selected File: ${file.name}');
            //   }).toList(),
            // )
            //     : Text('No files selected'),
            if (pickedFile != null)
              Center(
                child: Text(pickedFile!.name),
              ),
            Center(
              child :ElevatedButton(
                onPressed: uploadFile,
                child: Text('Upload File'),
              ),
            ),
            if(upload)
              SizedBox(
                height: 50,
                child: Stack(
                  fit:StackFit.expand,
                  children: [
                    LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey,
                      color: Colors.green,
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
    );
  }
}
