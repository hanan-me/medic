import 'package:flutter/material.dart';
import 'package:medic/Login_Page.dart';
import 'package:medic/Signup_Page.dart';
class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: h*0.07,),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: w*0.3,
              height: h*0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "img/logo up.png"
                      ),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left:40,right:40),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "MEDIC",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: h*0.01,),
                Text(
                  "Let's Get Started!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: h*0.02,),
                Text(
                  "Login to enjoy the features we've provided and stays healthy.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: h*0.02,),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => LoginPage()));
            },
            child: Container(
                width: w*0.5,
                height: h*0.06,
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
                    "Login",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => SignupPage()));
            },
            child: Container(
                width: w*0.5,
                height: h*0.06,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal),
                    borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
