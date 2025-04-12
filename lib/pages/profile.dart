import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile Account'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),

          // Section: Foto & Data User
          Column(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              const SizedBox(height: 12),
              const Text(
                'Nama: Andi Wijaya',
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                'Email: andi@mail.com',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 32),
          const Divider(),

          // Menu List
          _buildMenuItem(Icons.edit, 'Edit Profil', () {
            // aksi edit profil
          }),
          _buildMenuItem(Icons.settings, 'Pengaturan', () {
            // aksi pengaturan
          }),
          _buildMenuItem(Icons.logout, 'Logout', () {
            // aksi logout
          }),

          const Divider(),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
