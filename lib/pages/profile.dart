import 'package:flutter/material.dart';
import 'editprofile.dart';
import 'aboutus.dart';
import 'package:mobprog_3/models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Column(
        children: [
          // Header dengan card profil
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3C8CE7), Color(0xFF00EAFF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 20), // <= padding atas dikurangi
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Profil Saya',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundImage: AssetImage(UserModel.img),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              UserModel.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4B4F57),
                              ),
                            ),
                            const SizedBox(height: 8),
                            ProfileInfoRow(title: "Email", value: UserModel.email),
                            ProfileInfoRow(title: "Phone", value: UserModel.phone),
                            ProfileInfoRow(title: "Address", value: UserModel.address),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Konten scrollable
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      _StatCard(icon: Icons.check_circle, label: "Selesai", count: "5"),
                      _StatCard(icon: Icons.timelapse, label: "Proses", count: "2"),
                      _StatCard(icon: Icons.star, label: "Ulasan", count: "3"),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _MenuTile(
                  icon: Icons.person,
                  label: 'My Account',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProfileScreen())),
                ),
                _MenuTile(
                  icon: Icons.dark_mode,
                  label: 'Dark Mode',
                  trailing: Switch(value: false, onChanged: (val) {}),
                ),
                _MenuTile(
                  icon: Icons.info,
                  label: 'About Us',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutUsScreen())),
                ),
                _MenuTile(
                  icon: Icons.logout,
                  label: 'Log Out',
                  onTap: () => Navigator.popUntil(context, (route) => route.isFirst),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInfoRow extends StatelessWidget {
  final String title;
  final String value;

  const ProfileInfoRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Row(
        children: [
          Text("$title: ",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4B4F57))),
          Expanded(
            child: Text(value, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}

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
          child: Icon(icon, color: Color(0xFF3C8CE7)),
        ),
        const SizedBox(height: 6),
        Text(count, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _MenuTile({
    required this.icon,
    required this.label,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      leading: Icon(icon, color: Color(0xFF3C8CE7)),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
