import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medic/Doctor/doc_home.dart';
import 'package:medic/Doctor/doctor_profile.dart';


import '../Auths/auth_controller.dart';

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({super.key});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed:()=> Get.back(),icon: const Icon(Icons.arrow_back, color: Colors.white)),
        title: Text("Profile"),
      ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(left: 25,right: 25),
            child: Column(
              children: [
                SizedBox(height: h*0.05,),
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
                    "Doctor Name..",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: h*0.035,),
                RoundedBtnWidget( title: "Edit Profile",onPress: () { Get.to(Doctor_Profile()); },),
                SizedBox(height: h*0.05,),
                ProfileManage(title:"My Profile",icon: Icons.person,onPress:(){
                  Get.to(Doctor_Home());
                }),
                ProfileManage(title:"Messages",icon: Icons.message,onPress:(){}),
                ProfileManage(title:"Appointments",icon: Icons.calendar_month,onPress:(){}),
                Divider(
                  color: Colors.grey,
                ),
                ProfileManage(title:"Setting",icon: Icons.settings,onPress:(){}),
                ProfileManage(title:"Logout",icon: Icons.logout,endIcon: false, onPress:(){
                  AuthController.instance.logOut();
                }),
              ],
            ),
          ),
        ),
    );
  }
}

class RoundedBtnWidget extends StatelessWidget {
  const RoundedBtnWidget({
    super.key, this.title, required this.onPress,
  });

  final title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPress,
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
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
      ),
    );
  }
}


class ProfileManage extends StatelessWidget {
  const ProfileManage({
    Key?key,
    required this.title,
    required this.icon,
    this.endIcon = true,
    required this.onPress,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final bool endIcon;
  final VoidCallback onPress;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.tealAccent.withOpacity(0.1),
        ),
        child: Icon(icon, color: Colors.teal),
      ),
      title: Text(title),
      trailing: endIcon? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.tealAccent.withOpacity(0.1),
        ),
        child: Icon(Icons.keyboard_arrow_right, color: Colors.teal),
      ): null,
    );
  }
}
