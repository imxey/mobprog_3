import 'package:flutter/material.dart';
import 'chat_detail.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> chatItems = [
      Container(
        padding: const EdgeInsets.all(16),
        child: Card(
          color: Colors.white,
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: const Icon(Icons.person),
            ),
            title: const Text(
              "Dzaky",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text("mantap, makasih bos"),
            trailing: const Text("21:30"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatDetailScreen(chatId: 0),
                ),
              );
            },
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(16),
        child: Card(
          color: Colors.white,
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: const Icon(Icons.person),
            ),
            title: const Text(
              "Najma",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text("Noted, utiwi revisi"),
            trailing: const Text("18:30"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatDetailScreen(chatId: 1),
                ),
              );
            },
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(16),
        child: Card(
          color: Colors.white,
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: const Icon(Icons.person),
            ),
            title: const Text(
              "Xeyla",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text("Gini amat nyari duit :("),
            trailing: const Text("09:30"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatDetailScreen(chatId: 2),
                ),
              );
            },
          ),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF3C8CE7), Color(0xFF00EAFF)],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Message',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: ListView(scrollDirection: Axis.vertical, children: [...chatItems]),
    );
  }
}
