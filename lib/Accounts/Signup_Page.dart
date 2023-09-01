import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medic/Auths/auth_controller.dart';

import 'Login_Page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  List dropDownListData = [
    {"title": "Doctor", "value": "1"},
    {"title": "Patient", "value": "2"},
    {"title": "Lab Scientist", "value": "3"},
    {"title": "Data Entry Operator", "value": "4"},
  ];
  String defaultValue = "";
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    List images = [
      "google.png",
      "facebook.png"
    ];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var _value = "-1";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: w * 0.3,
              height: h * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "img/logo up.png"
                      ),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:w*0.05,right: w*0.05),
              child: SingleChildScrollView(
                reverse: true,
                // physics: BouncingScrollPhysics(),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Register your account",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(height: h * 0.02,),
                    Container(
                      height: h*0.07,
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
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              isDense: true,
                              value: defaultValue,
                              isExpanded: true,
                              menuMaxHeight: 350,
                              items: [
                                const DropdownMenuItem(
                                    child: Text(
                                      "SignUp as",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    value: ""),
                                ...dropDownListData.map<DropdownMenuItem<String>>((data) {
                                  return DropdownMenuItem(
                                      child: Text(data['title']), value: data['value']);
                                }).toList(),
                              ],
                              onChanged: (value) {
                                // print("selected Value $value");
                                setState(() {
                                  defaultValue = value!;
                                });
                              }),
                        ),
                      ),
                    ),
                    SizedBox(height: h * 0.01,),
                    TextFieldWidget(hintText: "Your Name",icon: Icons.person,),
                    SizedBox(height: h * 0.01,),
                    TextFieldWidget(hintText: "Phone Number",icon: Icons.numbers_outlined,),
                    SizedBox(height: h * 0.01,),
                    TextFieldWidget(hintText: "DOB",icon: Icons.date_range,),
                    SizedBox(height: h * 0.01,),
                    TextFieldWidget(hintText: "Gender",icon: Icons.person,),
                    SizedBox(height: h * 0.01,),
                    TextFieldWidget(hintText: "CNIC",icon: Icons.numbers_outlined,),
                    SizedBox(height: h * 0.01,),
                    TextFieldWidget(hintText: "Email",icon: Icons.email_outlined,controler: emailController),
                    SizedBox(height: h * 0.01,),
                    TextFieldWidget(
                      hintText: "Password",icon: Icons.password_rounded,controler: passwordController,bol: true,),
                    SizedBox(height: h * 0.01,),
                    SizedBox(height: h * 0.03,),
                    GestureDetector(
                      onTap: () {
                        AuthController.instance.register(emailController.text.trim(),
                            passwordController.text.trim(),defaultValue);
                      },
                      child: Container(
                          width: w * 0.4,
                          height: h * 0.06,
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
                              "Sign up",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )
                      ),
                    ),
                    SizedBox(height: w * 0.01,),
                    RichText(text: TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 16
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => LoginPage())
                    )),
                    Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
                  ],
                ),
              ),
            ),
            // SizedBox(height: 20,),
            // RichText(text: TextSpan(
            //   text: "Sign up using the following method",
            //   style: TextStyle(
            //       color: Colors.grey[500],
            //       fontSize: 16
            //   ),
            // )),
            // SizedBox(height: w*0.01,),
            // Expanded(
            //   child: Wrap(
            //     children: List<Widget>.generate(
            //         2,
            //             (index) {
            //           return Padding(
            //             padding: const EdgeInsets.all(5.0),
            //             child: CircleAvatar(
            //               backgroundColor: Colors.white,
            //               radius: 30,
            //               child: CircleAvatar(
            //                 backgroundColor: Colors.white,
            //                 radius: 25,
            //                 backgroundImage: AssetImage(
            //                     "img/" + images[index]
            //                 ),
            //               ),
            //             ),
            //           );
            //         }
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key, this.icon, this.hintText, this.controler, this.bol = false,

  });

  final icon;
  final hintText;
  final controler;
  final bool bol;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          controller: controler,
          obscureText: bol,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon, color: Colors.teal),
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
    );
  }
}
