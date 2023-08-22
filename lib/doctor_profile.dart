import 'package:flutter/material.dart';
class Doctor_Profile extends StatefulWidget {
  const Doctor_Profile({super.key});

  @override
  State<Doctor_Profile> createState() => _Doctor_ProfileState();
}

class _Doctor_ProfileState extends State<Doctor_Profile> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: h*0.07,),
            Center(
              child: Container(
                width: w*0.3,
                height: h*0.14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage(
                            "img/pexels-tima-miroshnichenko-5407206.jpg"
                        ),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            SizedBox(height: h*0.012,),
            Text(
              "Doctor Name.."
            ),
            Container(
              width: w,
              height: h*0.12,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "img/bar.png"
                      ),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0,top: 20,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's complete your Profile!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: h*0.015,),
            Container(
                margin: const EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
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
                    hintText: "Specialization",
                    prefixIcon: Icon(Icons.more_horiz, color:Colors.teal),
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
            SizedBox(height: h*0.015,),
            Container(
                margin: const EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
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
                    hintText: "Working at..",
                    prefixIcon: Icon(Icons.local_hospital, color:Colors.teal),
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
            SizedBox(height: h*0.015,),
            Container(
                margin: const EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
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
                    hintText: "About Yourself..",
                    // prefixIcon: Icon(Icons., color:Colors.teal),
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
                  maxLines: 8,
                )
            ),
            SizedBox(height: h*0.035,),
            Container(
                width: w*0.4,
                height: h*0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        spreadRadius: 6,
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
                    ),
                    // image: DecorationImage(
                    //   image: AssetImage(
                    //       "img/btn.jpg"
                    //   ),
                    //   fit: BoxFit.cover,
                    // ),

                ),
                child: Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
            ),
          ],
        ),
      )
    );
  }
}
