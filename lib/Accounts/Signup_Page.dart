import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medic/Auths/auth_controller.dart';
import 'package:intl/intl.dart';

import 'Login_Page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final numberController = TextEditingController();
  final cnicController = TextEditingController();
  final genderController = TextEditingController();
  final nameController = TextEditingController();


  List dropDownListData = [
    {"title": "Doctor", "value": "Doctor"},
    {"title": "Patient", "value": "Patient"},
    {"title": "Lab Scientist", "value": "Lab Scientist"},
    {"title": "Data Entry Operator", "value": "Data Entry Operator"},
  ];
  List gender = [
    {"title": "Male", "value": "Male"},
    {"title": "Female", "value": "Female"},
  ];
  String defaultValue = "";
  String gtValue = "";
  String dob = "yyyy-MM_dd";
  DateTime dateTime = DateTime.now();
  // String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  void _showDatePicker(){
    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime(2025)
    ).then((value){
      setState(() {
        dateTime = value!;
        dob = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
      });
    });
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
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
                        padding: EdgeInsets.only(left: w*0.07,right: w*0.03,),
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
                    TextFieldWidget(hintText: "Enter Name",icon: Icons.person,
                      controler: nameController,
                    validator: (value){},),
                    SizedBox(height: h * 0.01,),
                    TextFieldWidget(hintText: "Phone Number",icon: Icons.phone,
                      type: TextInputType.phone,
                      controler: numberController,
                        validator: (value){}),
                    SizedBox(height: h * 0.01,),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      height: 58,
                      decoration:  BoxDecoration(
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
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                child: Text(
                                  dob,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54
                                  ),
                                ),
                              )
                          ),
                          Expanded(
                            child: MaterialButton(
                                padding: EdgeInsets.only(left: h*0.12),
                                onPressed: _showDatePicker,
                                child: Icon(Icons.calendar_month,color: Colors.teal,)
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: h * 0.01,),
                    Container(
                      height: h*0.07,
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
                        padding: EdgeInsets.only(left: w*0.07,right: w*0.03,),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              isDense: true,
                              value: gtValue,
                              isExpanded: true,
                              menuMaxHeight: 350,
                              items: [
                                const DropdownMenuItem(
                                    child: Text(
                                      "Gender",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    value: ""),
                                ...gender.map<DropdownMenuItem<String>>((data) {
                                  return DropdownMenuItem(
                                      child: Text(data['title']), value: data['value']);
                                }).toList(),
                              ],
                              onChanged: (value) {
                                // print("selected Value $value");
                                setState(() {
                                  gtValue = value!;
                                });
                              }),
                        ),
                      ),
                    ),
                    SizedBox(height: h * 0.01,),
                    TextFieldWidget(hintText: "CNIC",icon: Icons.numbers_outlined,
                      controler: cnicController,type: TextInputType.phone,validator: (value){}),
                    SizedBox(height: h * 0.01,),
                    TextFieldWidget(hintText: "Email",icon: Icons.email_outlined,
                        controler: emailController,validator: (value){
                          if (value!.length == 0) {
                            return "Email cannot be empty";
                          }
                          if (!RegExp(
                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ("Please enter a valid email");
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(height: h * 0.01,),
                    TextFieldWidget(
                      hintText: "Password",icon: Icons.password_rounded,
                      controler: passwordController,bol: true,
                        validator: (value){
                          RegExp regex = new RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          }
                          if (!regex.hasMatch(value)) {
                            return ("please enter valid password min. 6 character");
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(height: h * 0.01,),
                    SizedBox(height: h * 0.03,),
                    GestureDetector(
                      onTap: () {
                        AuthController.instance.register(nameController.text.trim(),
                            numberController.text.trim(),
                            cnicController.text.trim(),
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            defaultValue,gtValue,dob);
                      },
                      child: Container(
                          width: w * 0.4,
                          height: h * 0.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
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
                                fontSize: 20,
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
                    SizedBox(height: w * 0.05),
                    Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key, this.icon, this.hintText, this.controler, this.bol = false, this.type, required String? Function(dynamic value) validator, this.formKey,

  });
  final icon;
  final type;
  final hintText;
  final controler;
  final bool bol;
  final formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Form(
          key: formKey,
          child: TextFormField(
            controller: controler,
            keyboardType: type,
            obscureText: bol,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(icon, color: Colors.teal),
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
          ),
        )
    );
  }
}
