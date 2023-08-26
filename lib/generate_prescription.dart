import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:medic/doc_dash.dart';
class Generate_Prescription extends StatefulWidget {
  const Generate_Prescription({super.key});

  @override
  State<Generate_Prescription> createState() => _Generate_PrescriptionState();
}

class _Generate_PrescriptionState extends State<Generate_Prescription> {
  List<TextEditingController> listController = [TextEditingController()];
  @override
  bool morning = false;
  bool noon = false;
  bool evening = false;
  String ans = "";
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed:()=> Get.back(),icon: const Icon(Icons.arrow_back, color: Colors.white)),
        title: Text("Prescription"),
        actions: [IconButton(onPressed:()=> Get.to(()=> DoctorDashboard()),
            icon: const Icon(Icons.logout_outlined, color: Colors.white))],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: h*0.01,),
              Container(
                child: Lottie.asset(
                  'animations/aFwlh3S3cv.json',
                  height: h * 0.25,
                  repeat: true,
                  reverse: true,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Generate Prescription",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.teal,
                  ),
                ),
              ),
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemCount: listController.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 7,
                                    offset: Offset(1, 1),
                                    color: Colors.grey.withOpacity(0.4),
                                  )
                                ]
                            ),
                            child: TextField(
                              controller: listController[index],
                              decoration: InputDecoration(
                                hintText: "Medicine Name",
                                prefixIcon: Icon(Icons.medication, color: Colors.teal),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
                                    )
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1.0
                                    )
                                ),
                              ),
                            )
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: CheckboxListTile(
                                  title: Text('Morning'),
                                  checkColor: Colors.white,
                                  activeColor: Colors.teal,
                                  value: morning, onChanged: (val){
                                    setState(() {
                                      morning = val!;
                                      if(morning == true){
                                        ans = "Morning";
                                      }
                                    });
                                },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: CheckboxListTile(
                                  title: Text('Noon'),
                                  checkColor: Colors.white,
                                  activeColor: Colors.teal,
                                  value: noon, onChanged: (val){
                                  setState(() {
                                    noon = val!;
                                    if(noon == true){
                                      ans = "Noon";
                                    }
                                  });
                                },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: CheckboxListTile(
                                  title: Text('Evening'),
                                  checkColor: Colors.white,
                                  activeColor: Colors.teal,
                                  value: evening, onChanged: (val){
                                  setState(() {
                                    evening = val!;
                                    if(evening == true){
                                      ans = "Night";
                                    }
                                  });
                                },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        index != 0
                            ? GestureDetector(
                                onTap: (){
                                  setState(() {
                                    listController[index].clear();
                                    listController[index].dispose();
                                    listController.removeAt(index);
                                  });
                                },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 35,
                              ),
                            )
                            :const SizedBox()
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    listController.add(TextEditingController());
                  });
                },
                child: Container(
                    width: w * 0.4,
                    height: h * 0.055,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage(
                              "img/btn.jpg"
                          ),
                          fit: BoxFit.cover,
                        )
                    ),
                    child: Center(
                      child: Text(
                        "Add More",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
