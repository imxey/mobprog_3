import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const Navbar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF3C8CE7),
          unselectedItemColor: Color(0xFF747B89),
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Icon(Icons.home),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Icon(Icons.history),
              ),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Icon(Icons.message),
              ),
              label: "Message",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Icon(Icons.person),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
