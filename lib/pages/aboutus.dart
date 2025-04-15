import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Column(
        children: [
          // Header gradient seperti home
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 20),
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
            child: const SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tentang Kami',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Kami adalah mahasiswa TI yang berkolaborasi membuat aplikasi pemesanan jasa desain grafis berbasis mobile.',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // List biodata
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                BioCard(
                  name: 'Xeyla Vithra Arfina',
                  nim: '2307411032',
                  kelas: 'TI-4B',
                  imagePath: 'assets/xeyla.jpg',
                ),
                SizedBox(height: 16),
                BioCard(
                  name: 'Muhammad Dzaky Fuzan',
                  nim: '2307411040',
                  kelas: 'TI-4B',
                  imagePath: 'assets/dzaky.jpg',
                ),
                SizedBox(height: 16),
                BioCard(
                  name: 'Najma Gusti Ayu Mahesa',
                  nim: '2307411050',
                  kelas: 'TI-4B',
                  imagePath: 'assets/najma.jpg',
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BioCard extends StatelessWidget {
  final String name;
  final String nim;
  final String kelas;
  final String imagePath;

  const BioCard({
    super.key,
    required this.name,
    required this.nim,
    required this.kelas,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A628A),
            ),
          ),
          const SizedBox(height: 8),
          Text('NIM: $nim', style: const TextStyle(fontSize: 14)),
          Text('Kelas: $kelas', style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
