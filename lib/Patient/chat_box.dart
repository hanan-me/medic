import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ChatBox extends StatefulWidget {
  final String docName;
  const ChatBox({
    super.key,
    required this.docName,
  });

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed:()=> Get.back(),icon: const Icon(Icons.arrow_back, color: Colors.white)),
        title: Text(widget.docName),
      ),
    );
  }
}
