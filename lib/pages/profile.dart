import 'package:flutter/material.dart';
import 'editprofile.dart';
import 'aboutus.dart';
import 'package:mobprog_3/models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFF2EB),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF7AB2D3),
        title: const Text("Account Profile", style: TextStyle(color: Colors.black)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        children: [
          // Bagian Profile Card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFB9E5E8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage(UserModel.img),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        UserModel.name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4A628A)),
                      ),
                      SizedBox(height: 6),
                      ProfileInfoRow(title: "Email", value: UserModel.email),
                      ProfileInfoRow(title: "Phone", value: UserModel.phone),
                      ProfileInfoRow(title: "Address", value: UserModel.address),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Statistik Mini
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _StatCard(icon: Icons.check_circle, label: "Selesai", count: "5"),
              _StatCard(icon: Icons.timelapse, label: "Proses", count: "2"),
              _StatCard(icon: Icons.star, label: "Ulasan", count: "3"),
            ],
          ),

          const SizedBox(height: 30),

          // Menu Navigasi
          ListTile(
            leading: const Icon(Icons.person, color: Color(0xFF4A628A)),
            title: const Text('My Account'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfileScreen()),
              );
            },
          ),

          // Switch Dark Mode (dummy)
          SwitchListTile(
            value: false,
            onChanged: (val) {
              // Tambahkan logika untuk dark mode di sini
            },
            title: const Text("Dark Mode"),
            secondary: const Icon(Icons.dark_mode, color: Color(0xFF4A628A)),
          ),

          ListTile(
            leading: const Icon(Icons.info, color: Color(0xFF4A628A)),
            title: const Text('About Us'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUsScreen()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFF4A628A)),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}

// Komponen Info Baris Profil
class ProfileInfoRow extends StatelessWidget {
  final String title;
  final String value;

  const ProfileInfoRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title: ", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          Expanded(
            child: Text(value, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}

// Komponen Kartu Statistik
class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String count;

  const _StatCard({required this.icon, required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.white,
          child: Icon(icon, color: Color(0xFF4A628A)),
        ),
        const SizedBox(height: 6),
        Text(count, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

