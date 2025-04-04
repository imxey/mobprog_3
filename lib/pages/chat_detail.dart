import 'package:flutter/material.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat Detail")),
      body: Center(
        child: Text("Ini halaman detail chat", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
