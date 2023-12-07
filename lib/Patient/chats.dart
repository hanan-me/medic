import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medic/Patient/chat_box.dart';

class Chats_P extends StatefulWidget {
  const Chats_P({super.key});
  @override
  State<Chats_P> createState() => _Chats_PState();
}

class _Chats_PState extends State<Chats_P> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String docName ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed:()=> Get.back(),icon: const Icon(Icons.arrow_back, color: Colors.white)),
        title: Text("Chats"),
      ),
      body: _buildUserList(),
    );
  }
  Widget _buildUserList(){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Users').snapshots(),
      builder: (context, snapshot){
        if (snapshot.hasError){
          return const Text('Error');
        }
        
        if (snapshot.connectionState== ConnectionState.waiting){
          return const Text('loading..');
        }
        
        return ListView(
          children: snapshot.data!.docs.map<Widget>((doc) => _buildUserListItem(doc)).toList(),
        );
      },
    );
  }
  Widget _buildUserListItem(DocumentSnapshot document){
    Map<String, dynamic>data = document.data()! as Map<String, dynamic>;
    if (_auth.currentUser!.email == data['Email']){
        docName = data['Name'];
    }

    if (data['Role'] == "Doctor"){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(15),
            child: Text(data['Name'],
            style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),
            ),
          ),
          onTap: (){Get.to(() => ChatBox(docName:docName));},
        ),
      );
    }
    else{
      return Container();
    }
    // return Container();
  }
}
