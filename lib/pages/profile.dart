import 'package:flutter/material.dart';
import 'history.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void showAboutUsPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("About Us"),
          content: SizedBox(
            height: 180,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                ListTile(
                  title: Text("1. Nama Anggota 1"),
                  subtitle: Text(""),
                ),
                ListTile(
                  title: Text("2. Nama Anggota 2"),
                  subtitle: Text(""),
                ),
                ListTile(
                  title: Text("3. Nama Anggota 3"),
                  subtitle: Text(""),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Tutup"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFF2EB),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF7AB2D3),
        title: const Text("Profil Pengguna", style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // Header dengan nama dan foto
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF4A628A),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/user_placeholder.png"), // Ganti sesuai asset kamu
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Debuggers",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text("debuggers@email.com",
                          style: TextStyle(fontSize: 14, color: Colors.white70)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // List menu navigasi
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.person_outline, color: Color(0xFF4A628A)),
                  title: const Text("My Account"),
                  subtitle: const Text("Edit profil Anda"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => Navigator.pushNamed(context, '/edit-profile'),
                ),
                ListTile(
                  leading: const Icon(Icons.history, color: Color(0xFF4A628A)),
                  title: const Text("My Order"),
                  subtitle: const Text("Lihat riwayat pesanan"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const HistoryScreen()),
                    )
                    },
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Color(0xFF4A628A)),
                  title: const Text("Log out"),
                  subtitle: const Text("Keluar dari akun"),
                  onTap: () => Navigator.pushReplacementNamed(context, '/login'),
                ),
                const Divider(thickness: 1),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text("More", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline, color: Color(0xFF4A628A)),
                  title: const Text("About Us"),
                  onTap: () => showAboutUsPopup(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
