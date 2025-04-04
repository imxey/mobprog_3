import 'package:flutter/material.dart';
import 'chat_detail.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Message")),
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatDetailScreen()),
          );
        },
        child: Text("Chat Detail"),
      ),
    );
  }
}
